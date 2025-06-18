// prisma\helpers\deleteSafely.ts

import { Prisma } from '@prisma/client';

async function deleteSafely(fn: () => Promise<unknown>, name: string) {
  const MAX_TRIES = 10;
  let tries = 0;
  while (true) {
    try {
      await fn();
      console.log(`✅ Deleted ${name}`);
      return;
    } catch (e: unknown) {
      if (
        e instanceof Prisma.PrismaClientKnownRequestError &&
        e.code === 'P2034' &&
        tries < MAX_TRIES
      ) {
        tries++;
        console.log(`⚠️ Retrying to delete ${name}`);
        continue;
      }

      throw e;
    }
  }
}

export default deleteSafely;
