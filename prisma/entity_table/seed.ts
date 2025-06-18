// prisma\entity_table\seed.ts

import prisma from '~/prisma/lib/client';
import { faker } from '@faker-js/faker';
import cleanUp from '~/prisma/helpers/cleanUp';

async function seedEntityTable() {
  const skipCleanup = process.env.SKIP_CLEANUP === 'false';

  if (!skipCleanup) {
    console.log('🧹 Cleaning up…');
    await cleanUp();
    console.log('🧹 Cleaning up complete.');
  } else {
    console.log('⚠️ Skipping cleanup (SKIP_CLEANUP=true)');
  }

  const COUNT = 10;

  const fakeTableRecords = Array.from({ length: COUNT }).map(() => ({
    field_1: faker.lorem.word(),
    field_2: faker.datatype.boolean(),
    field_3: faker.number.int({ min: 0, max: 100 }),
    field_4: faker.date.recent(),
  }));

  await prisma.entity_table.createMany({
    data: fakeTableRecords,
    skipDuplicates: true,
  });

  console.log(`🎉 Seeded ${COUNT} records in entity_table.`);
}

export default seedEntityTable;
