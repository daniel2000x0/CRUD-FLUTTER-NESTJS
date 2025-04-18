import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  app.enableCors( {origin: 'http://192.168.56.1:3000',
    methods: 'GET, POST, PUT, DELETE',
  }); 
  await app.listen(3000, '0.0.0.0');
}
bootstrap();
