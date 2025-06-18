// src\records\dto\create-record.dto.ts

export class CreateRecordDto {
  field_1!: string;
  field_2?: boolean; // optional, default is false in schema
  field_3!: number;
  field_4?: Date; // optional, default is now in schema
}
