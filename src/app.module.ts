import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PhongModule } from './phong/phong.module';
import { BinhLuanModule } from './binh-luan/binh-luan.module';
import { ViTriModule } from './vi-tri/vi-tri.module';
import { NguoiDungModule } from './nguoi-dung/nguoi-dung.module';
import { DatPhongModule } from './dat-phong/dat-phong.module';
import { AuthModule } from './auth/auth.module';
import { ConfigModule } from '@nestjs/config';

@Module({
  imports: [
    AuthModule,
    BinhLuanModule,
    DatPhongModule,
    NguoiDungModule,
    PhongModule,
    ViTriModule,
    ConfigModule.forRoot({
      isGlobal: true,
    }),
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
