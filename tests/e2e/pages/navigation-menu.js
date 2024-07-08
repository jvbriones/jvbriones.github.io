import { Page } from '@playwright/test';

export class NavigationMenu {
  /**
   * @param {Page} page The Playwright page object.
   */
  constructor(page) {
    this.page = page;
    this.home = page.getByLabel('Main', { exact: true }).getByRole('link', { name: 'Home' })
    this.blog = page.getByLabel('Main', { exact: true }).getByRole('link', { name: 'Blog' })
  }

  async gotoHome() {
    await this.home.click();
  }

  async gotoBlog() {
    await this.blog.click();
  }
}