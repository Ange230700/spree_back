// src\types\nest.d.ts

import { Type, DynamicModule } from '@nestjs/common';

export type IEntryNestModule = Type<unknown> | DynamicModule;
