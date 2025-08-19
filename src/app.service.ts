import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
  getHello(): string {
    return 'Hello World! Ban Gaya Cluster!';
  }

  getPing(): string {
    return 'Pong!';
  }
}
