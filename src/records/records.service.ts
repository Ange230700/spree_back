// src\records\records.service.ts

import { Injectable, NotFoundException } from '@nestjs/common';
import prisma from '~/prisma/lib/client';
import { CreateRecordDto } from '~/src/records/dto/create-record.dto';
import { UpdateRecordDto } from '~/src/records/dto/update-record.dto';

@Injectable()
export class RecordsService {
  async create(createRecordDto: CreateRecordDto) {
    return await prisma.entitytable.create({ data: createRecordDto });
  }

  async findAll() {
    const records = await prisma.entitytable.findMany();
    return records;
  }

  async findOne(id: number) {
    const record = await prisma.entitytable.findUnique({ where: { id } });
    return record;
  }

  async update(id: number, updateRecordDto: UpdateRecordDto) {
    const record = await prisma.entitytable.findUnique({ where: { id } });
    if (!record) throw new NotFoundException(`Record with id ${id} not found`);
    return prisma.entitytable.update({ where: { id }, data: updateRecordDto });
  }

  async remove(id: number) {
    const record = await prisma.entitytable.findUnique({ where: { id } });
    if (!record) throw new NotFoundException(`Record with id ${id} not found`);
    return prisma.entitytable.delete({ where: { id } });
  }
}
