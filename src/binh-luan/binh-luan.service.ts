import { Injectable } from '@nestjs/common';
import { PrismaClient } from '@prisma/client';
import { BinhLuan } from './entities/binh-luan.entity';
import { binhLuanDTO } from './dto/binh-luan.dto';

@Injectable()
export class BinhLuanService {
  prisma = new PrismaClient();

  async getBinhLuan(): Promise<BinhLuan[]> {
    // eslint-disable-next-line prefer-const
    let data = await this.prisma.binh_luan.findMany();
    return data;
  }

  async postBinhLuan(body: binhLuanDTO): Promise<string> {
    // eslint-disable-next-line prefer-const
    let checkMaPhong = await this.prisma.phong.findFirst({
      where: {
        id: body.ma_phong,
      },
    });

    // eslint-disable-next-line prefer-const
    let checkNguoiDung = await this.prisma.nguoi_dung.findFirst({
      where: {
        id: body.ma_nguoi_binh_luan,
      },
    });

    if (checkMaPhong && checkNguoiDung) {
      await this.prisma.binh_luan.create({
        data: body,
      });
      // return token;
      return 'Thêm bình luận thành công';
    } else {
      return 'Mã phòng/ mã người dùng không tồn tại';
    }
  }

  async getBinhLuanTheoMaPhong(maPhong: number): Promise<BinhLuan[]> {
    // eslint-disable-next-line prefer-const
    let data = await this.prisma.binh_luan.findMany({
      where: {
        ma_phong: maPhong,
      },
    });
    return data;
  }

  async deleteBinhLuan(id: number) {
    // eslint-disable-next-line prefer-const
    let checkId: any = await this.prisma.binh_luan.findFirst({
      where: {
        id: id,
      },
    });
    if (checkId) {
      await this.prisma.binh_luan.delete({
        where: {
          id: id,
        },
      });
      return 'Xóa bình luận thành công';
    } else {
      return 'Xóa bình luận thất bại';
    }
  }

  async putBinhLuan(id: number, body: binhLuanDTO): Promise<string> {
    // eslint-disable-next-line prefer-const
    let checkId = await this.prisma.binh_luan.findFirst({
      where: {
        id: id,
      },
    });
    if (checkId) {
      await this.prisma.binh_luan.update({
        data: body,
        where: {
          id: id,
        },
      });
      return `Update bình luận ${id} thành công`;
    } else {
      return `ID: ${id} không tồn tại`;
    }
  }
}
