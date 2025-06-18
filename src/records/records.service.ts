// src\records\records.service.ts

import { Injectable, NotFoundException } from '@nestjs/common';
import prisma from '~/prisma/lib/client';
import { CreateRecordDto } from '~/src/records/dto/create-record.dto';
import { UpdateRecordDto } from '~/src/records/dto/update-record.dto';

@Injectable()
export class RecordsService {
  async create(createRecordDto: CreateRecordDto) {
    return prisma.entity_table.create({ data: createRecordDto });
  }

  async findAll() {
    return prisma.entity_table.findMany();
  }

  async findOne(id: number) {
    return prisma.entity_table.findUnique({ where: { id } });
  }

  async update(id: number, updateRecordDto: UpdateRecordDto) {
    const record = await prisma.entity_table.findUnique({ where: { id } });
    if (!record) throw new NotFoundException(`Record with id ${id} not found`);
    return prisma.entity_table.update({ where: { id }, data: updateRecordDto });
  }

  async remove(id: number) {
    const record = await prisma.entity_table.findUnique({ where: { id } });
    if (!record) throw new NotFoundException(`Record with id ${id} not found`);
    return prisma.entity_table.delete({ where: { id } });
  }
}
