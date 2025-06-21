// src\records\dto\create-record.dto.ts

import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import { IsString, IsBoolean, IsInt, Min, IsOptional } from 'class-validator';
import { Type, Transform } from 'class-transformer';

export class CreateRecordDto {
  @ApiProperty()
  @IsString()
  field_1!: string;

  @ApiPropertyOptional({ default: false })
  @IsOptional()
  @Transform(({ value }) => {
    return value === true || value === 'true';
  })
  @IsBoolean()
  field_2?: boolean;

  @ApiProperty({ description: 'An integer ≥ 0' })
  @Type(() => Number)
  @IsInt()
  @Min(0)
  field_3!: number;
}
