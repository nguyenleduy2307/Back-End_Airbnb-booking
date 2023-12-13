import { Injectable } from '@nestjs/common';
import { PrismaClient } from '@prisma/client';
import { NguoiDung } from './entities/nguoi-dung.entity';
import { nguoiDungDTO } from './dto/nguoi-dung.dto';
import * as bcrypt from 'bcrypt';

@Injectable()
export class NguoiDungService {
  prisma = new PrismaClient();

  async getNguoiDung(): Promise<NguoiDung[]> {
    // eslint-disable-next-line prefer-const
    let data = await this.prisma.nguoi_dung.findMany();
    return data;
  }

  async getNguoiDungTheoId(id: number) {
    // eslint-disable-next-line prefer-const
    let checkId: any = await this.prisma.nguoi_dung.findFirst({
      where: {
        id: id,
      },
    });

    if (checkId) {
      // eslint-disable-next-line prefer-const
      let data = await this.prisma.nguoi_dung.findFirst({
        where: {
          id: id,
        },
      });
      return data;
    } else {
      return 'Người dùng không tồn tại';
    }
  }

  async getNguoiDungTheoTen(TenNguoiDung: string): Promise<NguoiDung[]> {
    // eslint-disable-next-line prefer-const
    let data = await this.prisma.nguoi_dung.findMany({
      where: {
        name: {
          contains: TenNguoiDung,
        },
      },
    });
    return data;
  }

  async deleteNguoiDung(id: number): Promise<string> {
    // eslint-disable-next-line prefer-const
    let checkId: any = await this.prisma.nguoi_dung.findFirst({
      where: {
        id: id,
      },
    });

    if (checkId) {
      await this.prisma.nguoi_dung.delete({
        where: {
          id: id,
        },
      });
      return 'Xóa người dùng thành công';
    } else {
      return 'Xóa người dùng thất bại';
    }
  }

  async postNguoiDung(body: nguoiDungDTO): Promise<string> {
    let {email, password, name, phone, birthday, avatar, gender, role} = body;

    let checkEmail = await this.prisma.nguoi_dung.findFirst({
        where: {
            email: email,
        },
    })

    let hashpassword = bcrypt.hashSync(password, 10);

    if (checkEmail) {
      return 'Email đã tồn tại';
    } else {
        let newData = {
            email,
            password: hashpassword,
            name,
            phone,
            birthday,
            avatar,
            gender,
            role
        }
        let result = await this.prisma.nguoi_dung.create({
          data: newData,
        })
        return 'Thêm người dùng thành công'
    }
  }

  async putNguoiDung(id: number, body: nguoiDungDTO): Promise<string> {
    // eslint-disable-next-line prefer-const
    let checkId = await this.prisma.nguoi_dung.findFirst({
      where: {
        id: id,
      },
    });

    if (checkId) {
      await this.prisma.nguoi_dung.update({
        data: body,
        where: {
          id: id,
        },
      });
      return 'Update người dùng thành công';
    } else {
      return 'Id không tồn tại';
    }
  }
}
