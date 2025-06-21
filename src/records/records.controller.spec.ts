// src/records/records.controller.spec.ts

import { Test, TestingModule } from '@nestjs/testing';
import { RecordsController } from '~/src/records/records.controller';
import { RecordsService } from '~/src/records/records.service';
import { faker } from '@faker-js/faker';

describe('RecordsController', () => {
  let controller: RecordsController;
  let service: RecordsService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [RecordsController],
      providers: [
        {
          provide: RecordsService,
          useValue: {
            create: jest.fn(),
            findAll: jest.fn(),
            findOne: jest.fn(),
            update: jest.fn(),
            remove: jest.fn(),
          },
        },
      ],
    }).compile();

    controller = module.get<RecordsController>(RecordsController);
    service = module.get<RecordsService>(RecordsService);
  });

  describe('findAll', () => {
    it('should return an array of records', async () => {
      const mockRecords = Array.from({ length: 5 }).map(() => ({
        id: faker.number.int({ min: 1, max: 1000 }),
        field_1: faker.lorem.word(),
        field_2: faker.datatype.boolean(),
        field_3: faker.number.int({ min: 0, max: 100 }),
        field_4: faker.date.recent(),
      }));
      jest.spyOn(service, 'findAll').mockResolvedValue(mockRecords);

      await expect(controller.findAll()).resolves.toBe(mockRecords);
      expect(service.findAll).toHaveBeenCalled();
    });
  });

  describe('findOne', () => {
    it('should return a single record when found', async () => {
      const mockRecord = {
        id: faker.number.int({ min: 1, max: 1000 }),
        field_1: faker.lorem.word(),
        field_2: faker.datatype.boolean(),
        field_3: faker.number.int({ min: 0, max: 100 }),
        field_4: faker.date.recent(),
      };
      jest.spyOn(service, 'findOne').mockResolvedValue(mockRecord);

      await expect(controller.findOne(mockRecord.id)).resolves.toBe(mockRecord);
      expect(service.findOne).toHaveBeenCalledWith(mockRecord.id);
    });
  });

  describe('create', () => {
    it('should create a record', async () => {
      const dto = {
        field_1: faker.lorem.word(),
        field_2: faker.datatype.boolean(),
        field_3: faker.number.int({ min: 0, max: 100 }),
        field_4: faker.date.recent(),
      };
      const created = { id: 1, ...dto };
      jest.spyOn(service, 'create').mockResolvedValue(created);

      await expect(controller.create(dto)).resolves.toBe(created);
      expect(service.create).toHaveBeenCalledWith(dto);
    });
  });

  describe('update', () => {
    it('should update a record', async () => {
      const id = 1;
      const dto = { field_1: 'updated' };
      const updated = {
        id,
        field_1: dto.field_1,
        field_2: faker.datatype.boolean(),
        field_3: faker.number.int({ min: 0, max: 100 }),
        field_4: faker.date.recent(),
      };
      jest.spyOn(service, 'update').mockResolvedValue(updated);

      await expect(controller.update(id, dto)).resolves.toBe(updated);
      expect(service.update).toHaveBeenCalledWith(id, dto);
    });
  });

  describe('remove', () => {
    it('should remove a record', async () => {
      const id = 1;
      const removed = {
        id,
        field_1: faker.lorem.word(),
        field_2: faker.datatype.boolean(),
        field_3: faker.number.int({ min: 0, max: 100 }),
        field_4: faker.date.recent(),
      };
      jest.spyOn(service, 'remove').mockResolvedValue(removed);
      await expect(controller.remove(id)).resolves.toBeUndefined();
      expect(service.remove).toHaveBeenCalledWith(id);
    });
  });
});
