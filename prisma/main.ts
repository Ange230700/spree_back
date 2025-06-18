// prisma\main.ts

import prisma from '~/prisma/lib/client';
import seedEntityTable from '~/prisma/entity_table/seed';

async function main() {
  console.log('🌱 Seeding...');
  await seedEntityTable();
  console.log('🌱 Seeding complete.');
}

main()
  .catch((e) => {
    console.error('💥 Error seeding:', e);
    process.exit(1);
  })
  .finally(() => {
    prisma.$disconnect();
  });
