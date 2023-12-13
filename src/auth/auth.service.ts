import { Injectable } from '@nestjs/common';
import { PrismaClient } from '@prisma/client';
import { signinDTO } from './dto/signin.dto';
import * as bcrypt from 'bcrypt';
import { JwtService } from '@nestjs/jwt';
import { signupDTO } from './dto/signup.dto';

@Injectable()
export class AuthService {
  constructor(
    private jwtService: JwtService, // lib giúp mình tạo token
  ) {}

  prisma = new PrismaClient();

  async signup(body: signupDTO): Promise<string> {

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
        return 'Đăng ký thành công'
    }
  }

  async signin(body: signinDTO):Promise<string> {
    let {email, password} = body;

    let checkEmail = await this.prisma.nguoi_dung.findFirst({
      where: {
        email: email,
      },
    });

    if (checkEmail) {
      let checkPassword = bcrypt.compareSync(password, checkEmail.password);

      if (checkPassword) {

        let data = {
          id: checkEmail.id,
          email,
          name: checkEmail.name,
        };

        let token = this.jwtService.sign({data: data}, {
          expiresIn: "60m",
          secret: "Node36"
        })

        return token;
      } else {
        return 'Password không đúng';
      }

    } else {
      return 'Email chưa được đăng ký';
    }
  }
}
