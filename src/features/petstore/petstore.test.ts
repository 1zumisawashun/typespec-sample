import { describe, expect, it } from "vitest";
import { getListPetsMockHandler } from "./endpoints/petstore/petstore.msw.generated";
import { server } from "../../functions/msw";
import { listPets } from "./endpoints/petstore/petstore.generated";

describe("suite", () => {
  it("msw mock http://hello", async () => {
    server.use(getListPetsMockHandler());
    const response = await listPets();
    expect(response.data).toBe("hello");
  });
});
