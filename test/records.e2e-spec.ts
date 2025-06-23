// test\records.e2e-spec.ts

import { Test, TestingModule } from '@nestjs/testing';
import { INestApplication } from '@nestjs/common';
import * as request from 'supertest';
import { AppModule } from '~/src/app.module';
import prisma from '~/prisma/lib/client';

describe('Records (e2e)', () => {
  let app: INestApplication;
  let createdId: number;

  beforeAll(async () => {
    const moduleFixture: TestingModule = await Test.createTestingModule({
      imports: [AppModule],
    }).compile();

    app = moduleFixture.createNestApplication();
    await app.init();
  });

  afterAll(async () => {
    await prisma.entitytable.deleteMany({});
    await app.close();
  });

  it('/records (POST) creates record', async () => {
    const data = { field_1: 'foo', field_3: 42 };
    const res = await request(app.getHttpServer())
      .post('/records')
      .send(data)
      .expect(201);

    expect(res.body).toMatchObject({ field_1: 'foo', field_3: 42 });
    createdId = res.body.id;
  });

  it('/records (GET) returns all', async () => {
    const res = await request(app.getHttpServer()).get('/records').expect(200);
    expect(Array.isArray(res.body)).toBe(true);
  });

  it('/records/:id (GET) returns one', async () => {
    const res = await request(app.getHttpServer())
      .get(`/records/${createdId}`)
      .expect(200);
    expect(res.body.id).toBe(createdId);
  });

  it('/records/:id (PATCH) updates record', async () => {
    const res = await request(app.getHttpServer())
      .patch(`/records/${createdId}`)
      .send({ field_1: 'bar' })
      .expect(200);
    expect(res.body.field_1).toBe('bar');
  });

  it('/records/:id (DELETE) deletes record', async () => {
    await request(app.getHttpServer())
      .delete(`/records/${createdId}`)
      .expect(200);

    await request(app.getHttpServer()).get(`/records/${createdId}`).expect(404);
  });
});
