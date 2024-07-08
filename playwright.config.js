// @ts-check
const { defineConfig, devices } = require('@playwright/test');
const path = require('path');
require('dotenv').config({ path: path.resolve(__dirname, '.env') });

/**
 * @see https://playwright.dev/docs/test-configuration
 */
module.exports = defineConfig({
  testDir: './tests',
  /* test files will run in parallel (workers), but tests inside files will run in order */
  fullyParallel: false,
  /* avoid test.only on CI */
  forbidOnly: !!process.env.CI,
  /* single retry on CI */
  retries: process.env.CI ? 1 : 0,
  /* each worker is a parallel test file */
  workers: process.env.CI ? 2 : 1,
  timeout: 5000,
  reporter: [
    ['list'],
    ['html', { outputFolder: 'test-results/e2e-html-report', open: 'never' }],
    ['junit', { outputFile: 'test-results/e2e-junit.xml' }],
  ],
  outputDir: 'test-results/e2e-test-artifacts',
  /* Shared settings for all the projects below */
  use: {
    /* Base URL to use in actions like `await page.goto('.')`. */
    baseURL: process.env.E2E_BASE_URL,
    headless: true,
    ignoreHTTPSErrors: true,
    screenshot: 'on',
    video: 'on-first-retry',
    trace: 'on-first-retry',
    userAgent: 'Playwright E2E Tests',
  },

  /* Configure projects for major browsers */
  projects: [
    {
      name: 'chromium',
      use: { ...devices['Desktop Chrome'] },
    },

    {
      name: 'firefox',
      use: { ...devices['Desktop Firefox'] },
    },

    // {
    //   name: 'webkit',
    //   use: { ...devices['Desktop Safari'] },
    // },

    /* Test against mobile viewports. */
    // {
    //   name: 'Mobile Chrome',
    //   use: { ...devices['Pixel 5'] },
    // },
    // {
    //   name: 'Mobile Safari',
    //   use: { ...devices['iPhone 12'] },
    // },

    /* Test against branded browsers. */
    // {
    //   name: 'Microsoft Edge',
    //   use: { ...devices['Desktop Edge'], channel: 'msedge' },
    // },
    // {
    //   name: 'Google Chrome',
    //   use: { ...devices['Desktop Chrome'], channel: 'chrome' },
    // },
  ],

  /* Run your local dev server before starting the tests */
  // webServer: {
  //   command: 'yarn start',
  //   url: 'http://127.0.0.1:3000',
  //   reuseExistingServer: !process.env.CI,
  // },
});
