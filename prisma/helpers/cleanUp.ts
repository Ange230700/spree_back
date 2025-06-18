// prisma\helpers\cleanUp.ts

import prisma from '~/prisma/lib/client';
import deleteSafely from '~/prisma/helpers/deleteSafely';

async function cleanUp() {
  console.log('🧹 Cleaning up...');
  await deleteSafely(() => prisma.entity_table.deleteMany({}), 'entity_table');
  console.log('🧹 Cleaning up complete.');
}

export default cleanUp;
