import { Injectable } from '@nestjs/common';
import { PrismaClient } from '@prisma/client';
import { Phong } from './entities/phong.entity';
import { phongDTO } from './dto/phong.dto';

@Injectable()
export class PhongService {
  prisma = new PrismaClient();

  async getDanhSachPhong(): Promise<Phong[]> {
    // eslint-disable-next-line prefer-const
    let data = await this.prisma.phong.findMany();
    return data;
  }

  async getDanhSachPhongTheoViTri(maViTri: number): Promise<Phong[]> {
    // eslint-disable-next-line prefer-const
    let data = await this.prisma.phong.findMany({
      where: {
        ma_vi_tri: maViTri,
      },
    });
    return data;
  }

  async deletePhong(id: number): Promise<string> {
    // eslint-disable-next-line prefer-const
    let checkId: any = await this.prisma.phong.findFirst({
      where: {
        id: id,
      },
    });
    if (checkId) {
      await this.prisma.phong.delete({
        where: {
          id: id,
        },
      });
      return 'Xóa phòng thành công';
    } else {
      return 'Xóa phòng thất bại';
    }
  }

  async getDanhSachPhongTheoId(id: number) {
    // eslint-disable-next-line prefer-const
    let checkId: any = await this.prisma.phong.findFirst({
      where: {
        id: id,
      },
    });
    if (checkId) {
      // eslint-disable-next-line prefer-const
      let data = await this.prisma.phong.findFirst({
        where: {
          id: id,
        },
      });
      return data;
    } else {
      return 'Không tìm thấy tài nguyên';
    }
  }

  async postPhong(body: phongDTO): Promise<string> {
    // eslint-disable-next-line prefer-const
    let checkMaVT = await this.prisma.vi_tri.findFirst({
      where: {
        id: body.ma_vi_tri,
      },
    });

    if (checkMaVT) {
      await this.prisma.phong.create({
        data: body,
      });
      return 'Thêm phòng thành công';
    } else {
      return 'Mã vị trí không tồn tại';
    }
  }

  async putPhong(id: number, body: phongDTO): Promise<string> {
    // eslint-disable-next-line prefer-const
    let checkId = await this.prisma.phong.findFirst({
      where: {
        id: id,
      },
    });

    if (checkId) {
      await this.prisma.phong.update({
        data: body,
        where: {
          id: id,
        },
      });
      return 'Update phòng thành công';
    } else {
      return 'Id không tồn tại';
    }
  }
}
