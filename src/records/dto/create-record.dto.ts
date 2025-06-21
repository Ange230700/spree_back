// src\records\dto\create-record.dto.ts

import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import {
  IsString,
  IsBoolean,
  IsInt,
  IsOptional,
  IsDate,
} from 'class-validator';
import { Type } from 'class-transformer';

export class CreateRecordDto {
  @ApiProperty()
  @IsString()
  field_1!: string;

  @ApiPropertyOptional({ default: false })
  @IsOptional()
  @IsBoolean()
  field_2?: boolean; // optional, default is false in schema

  @ApiProperty()
  @IsInt()
  field_3!: number;

  @ApiPropertyOptional({ type: String, format: 'date-time' })
  @IsOptional()
  @Type(() => Date)
  @IsDate()
  field_4?: Date; // optional, default is now in schema
}
