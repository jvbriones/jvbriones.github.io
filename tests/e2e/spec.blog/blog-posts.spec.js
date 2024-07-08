const { test, expect } = require('@playwright/test');
const { NavigationMenu } = require('../pages/navigation-menu');
const { BlogPage } = require('../pages/blog-page');

const recentPosts = ["Welcome"]

test.describe('Blog posts tree', () => {
  for (const postName of recentPosts) {
    test('Post is listed', async ({ page }) => {
      await page.goto('.')
      const mainNavigation = new NavigationMenu(page);
      await mainNavigation.gotoBlog();
      await expect(page.getByLabel('Blog recent posts navigation')
        .getByRole('link', { name: postName })).toBeVisible();
    });
  }
});

test.skip('Important post is available', async ({ page }) => {
  await page.goto('.')
  const mergueQueuesPost = new BlogPage(page, "id-post");
  await mergueQueuesPost.goto()
  await expect(mergueQueuesPost.getContentLocator()).toContainText(
    `A merge queue helps increase velocity by automating pull request merges`,
  );
});
