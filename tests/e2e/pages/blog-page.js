import { Page } from '@playwright/test';

export class BlogPage {
  /**
   * @param {Page} page The Playwright page object.
   * @param {String} url The url of the blog post.
   */
  constructor(page, url) {
    this.page = page;
    this.url = url;
  }

  async goto() {
    await this.page.goto(`blog/${this.url}`);
  }

  getContentLocator() {
    return this.page.locator('#__blog-post-container');
  }
}