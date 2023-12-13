import { Injectable } from '@nestjs/common';
import { PrismaClient } from '@prisma/client';
import { DatPhong } from './entities/dat-phong.entity';
import { datPhongDTO } from './dto/dat-phong.dto';

@Injectable()
export class DatPhongService {
  prisma = new PrismaClient();

  async getDatPhong(): Promise<DatPhong[]> {
    // eslint-disable-next-line prefer-const
    let data = await this.prisma.dat_phong.findMany();
    return data;
  }

  async getDatPhongTheoId(id: number) {
    // eslint-disable-next-line prefer-const
    let checkId: any = await this.prisma.dat_phong.findFirst({
      where: {
        id: id,
      },
    });
    if (checkId) {
      // eslint-disable-next-line prefer-const
      let data = await this.prisma.dat_phong.findFirst({
        where: {
          id: id,
        },
      });
      return data;
    } else {
      return 'Không tìm thấy tài nguyên';
    }
  }

  async getDatPhongTheoMaNguoiDung(maNguoiDung: number): Promise<DatPhong[]> {
    // eslint-disable-next-line prefer-const
    let data = await this.prisma.dat_phong.findMany({
      where: {
        ma_nguoi_dung: maNguoiDung,
      },
    });
    return data;
  }

  async postDatPhong(body: datPhongDTO): Promise<string> {
    // eslint-disable-next-line prefer-const
    let checkMaPhong = await this.prisma.phong.findFirst({
      where: {
        id: body.ma_phong,
      },
    });

    // eslint-disable-next-line prefer-const
    let checkNguoiDung = await this.prisma.nguoi_dung.findFirst({
      where: {
        id: body.ma_nguoi_dung,
      },
    });

    if (checkMaPhong && checkNguoiDung) {
      await this.prisma.dat_phong.create({
        data: body,
      });
      return 'Đặt phòng thành công';
    } else {
      return 'Mã phòng/ mã người dùng không tồn tại';
    }
  }

  async deleteDatPhong(id: number): Promise<string> {
    // eslint-disable-next-line prefer-const
    let checkId: any = await this.prisma.dat_phong.findFirst({
      where: {
        id: id,
      },
    });
    if (checkId) {
      await this.prisma.dat_phong.delete({
        where: {
          id: id,
        },
      });
      return 'Xóa đặt phòng thành công';
    } else {
      return 'Xóa đặt phòng thất bại';
    }
  }

  async putDatPhong(id: number, body: datPhongDTO): Promise<string> {
    // eslint-disable-next-line prefer-const
    let checkId = await this.prisma.dat_phong.findFirst({
      where: {
        id: id,
      },
    });
    if (checkId) {
      await this.prisma.dat_phong.update({
        data: body,
        where: {
          id: id,
        },
      });
      return 'Update đặt phòng thành công';
    } else {
      return 'ID không tồn tại';
    }
  }
}
