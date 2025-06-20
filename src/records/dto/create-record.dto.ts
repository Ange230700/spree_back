// src\records\dto\create-record.dto.ts

import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';

export class CreateRecordDto {
  @ApiProperty()
  field_1!: string;

  @ApiPropertyOptional({ default: false })
  field_2?: boolean; // optional, default is false in schema

  @ApiProperty()
  field_3!: number;

  @ApiPropertyOptional({ type: String, format: 'date-time' })
  field_4?: Date; // optional, default is now in schema
}
