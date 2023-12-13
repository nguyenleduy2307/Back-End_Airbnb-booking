import { Controller, Post, Body } from '@nestjs/common';
import { AuthService } from './auth.service';
import { ApiTags } from '@nestjs/swagger';
import { signinDTO } from './dto/signin.dto';
import { signupDTO } from './dto/signup.dto';

@ApiTags('Auth')
@Controller('api/auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @Post('/signup')
  signup(@Body() body: signupDTO): Promise<string> {
    return this.authService.signup(body);
  }

  @Post('/signin')
  signin(@Body() body: signinDTO): Promise<string> {
    return this.authService.signin(body);
  }
}
