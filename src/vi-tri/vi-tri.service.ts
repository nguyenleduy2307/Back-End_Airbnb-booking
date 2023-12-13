import { Injectable } from '@nestjs/common';
import { ViTri } from './entities/vi-tri.entity';
import { PrismaClient } from '@prisma/client';
import { viTriDTO } from './dto/vi-tri.dto';

@Injectable()
export class ViTriService {
  prisma = new PrismaClient();

  async getViTri(): Promise<ViTri[]> {
    // eslint-disable-next-line prefer-const
    let data = await this.prisma.vi_tri.findMany();
    return data;
  }

  async getViTriTheoId(id: number) {
    // eslint-disable-next-line prefer-const
    let checkId: any = await this.prisma.vi_tri.findFirst({
      where: {
        id: id,
      },
    });

    if (checkId) {
      // eslint-disable-next-line prefer-const
      let data = await this.prisma.vi_tri.findFirst({
        where: {
          id: id,
        },
      });
      return data;
    } else {
      return 'Không tìm thấy tài nguyên';
    }
  }

  async deleteViTri(id: number): Promise<string> {
    // eslint-disable-next-line prefer-const
    let checkId: any = await this.prisma.vi_tri.findFirst({
      where: {
        id: id,
      },
    });
    if (checkId) {
      await this.prisma.vi_tri.delete({
        where: {
          id: id,
        },
      });
      return 'Xóa vị trí thành công';
    } else {
      return 'Xóa vị trí thất bại';
    }
  }

  async postViTri(body: viTriDTO): Promise<string> {
    await this.prisma.vi_tri.create({
      data: body,
    });
    return 'Thêm vị trí thành công';
  }

  async putViTri(id: number, body: viTriDTO): Promise<string> {
    // eslint-disable-next-line prefer-const
    let checkId = await this.prisma.vi_tri.findFirst({
      where: {
        id: id,
      },
    });

    if (checkId) {
      await this.prisma.vi_tri.update({
        data: body,
        where: {
          id: id,
        },
      });
      return 'Update vị trí thành công';
    } else {
      return 'Id không tồn tại';
    }
  }
}
