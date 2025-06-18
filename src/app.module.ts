// src\app.module.ts

import { Module } from '@nestjs/common';
import { AppController } from '~/src/app.controller';
import { AppService } from '~/src/app.service';
import { RecordsModule } from '~/src/records/records.module';

@Module({
  imports: [RecordsModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
