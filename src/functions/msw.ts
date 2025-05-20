import { setupServer } from "msw/node";
import { beforeAll, afterAll, afterEach } from "vitest";

export const server = setupServer();

beforeAll(() => server.listen());
afterEach(() => {
  server.resetHandlers();
});
afterAll(() => server.close());
