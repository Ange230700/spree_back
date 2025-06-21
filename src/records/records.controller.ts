// src\records\records.controller.ts

import {
  Controller,
  Get,
  Post,
  Body,
  Param,
  Patch,
  Delete,
  NotFoundException,
  ParseIntPipe,
  HttpCode,
  HttpStatus,
} from '@nestjs/common';
import {
  ApiTags,
  ApiResponse,
  ApiBadRequestResponse,
  ApiNotFoundResponse,
  ApiNoContentResponse,
  ApiCreatedResponse,
  ApiParam,
  ApiBody,
} from '@nestjs/swagger';

import type { entity_table as Record } from '@prisma/client';

import { RecordsService } from '~/src/records/records.service';
import { CreateRecordDto } from '~/src/records/dto/create-record.dto';
import { UpdateRecordDto } from '~/src/records/dto/update-record.dto';

@ApiTags('Records')
@Controller('records')
export class RecordsController {
  constructor(private readonly recordsService: RecordsService) {}

  @Post()
  @HttpCode(HttpStatus.CREATED)
  @ApiBody({ type: CreateRecordDto })
  @ApiCreatedResponse({
    description: 'Record successfully created',
    type: CreateRecordDto,
  })
  @ApiBadRequestResponse({ description: 'Validation failed' })
  create(@Body() createRecordDto: CreateRecordDto): Promise<Record> {
    return this.recordsService.create(createRecordDto);
  }

  @Get()
  @ApiResponse({
    status: HttpStatus.OK,
    description: 'List all records',
    type: CreateRecordDto,
    isArray: true,
  })
  findAll(): Promise<Record[]> {
    return this.recordsService.findAll();
  }

  @Get(':id')
  @ApiParam({ name: 'id', type: Number, description: 'Record ID' })
  @ApiResponse({
    status: HttpStatus.OK,
    description: 'The found record',
    type: CreateRecordDto,
  })
  @ApiNotFoundResponse({ description: 'Record not found' })
  async findOne(@Param('id', ParseIntPipe) id: number): Promise<Record> {
    const record = await this.recordsService.findOne(id);
    if (!record) {
      throw new NotFoundException(`Record with id ${id} not found`);
    }
    return record;
  }

  @Patch(':id')
  @ApiParam({ name: 'id', type: Number, description: 'Record ID' })
  @ApiBody({ type: UpdateRecordDto })
  @ApiResponse({
    status: HttpStatus.OK,
    description: 'Record successfully updated',
    type: CreateRecordDto,
  })
  @ApiBadRequestResponse({ description: 'Validation failed' })
  @ApiNotFoundResponse({ description: 'Record not found' })
  update(
    @Param('id', ParseIntPipe) id: number,
    @Body() updateRecordDto: UpdateRecordDto,
  ): Promise<Record> {
    return this.recordsService.update(id, updateRecordDto);
  }

  @Delete(':id')
  @HttpCode(HttpStatus.NO_CONTENT)
  @ApiParam({ name: 'id', type: Number, description: 'Record ID' })
  @ApiNoContentResponse({ description: 'Record successfully deleted' })
  @ApiNotFoundResponse({ description: 'Record not found' })
  async remove(@Param('id', ParseIntPipe) id: number): Promise<void> {
    await this.recordsService.remove(id);
  }
}
