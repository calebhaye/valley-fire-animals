# Sonoma County Fires Animals

## Public Site

http://animals.sonomafireinfo.com

## Contributing

* Look in the Github issue tracker for ideas of what to work on
* Feel free to discuss before starting work
* Assign an issue to yourself when you start to work on it to avoid
  duplicating someone else's work
* Clearly explain the changes you made in the commit message(s)
* Manually test your change and anything that might have been broken
* Run the test suite
* Submit a pull request when done

If you have an idea that's not already in issue tracker, please
discuss first.

If you want feedback on something that's a work-in-progress, please
clearly identify that on the pull request.

Automated tests for your feature are welcome, especially Capybara
end-to-end ones, but we're moving fast and loose right now and so
they're not required.

I'll handle the final deployment once the PR is merged.

## Configuration

I don't think anything is required in your .env yet.  Generally we
configure things via .env so that it's easy to manage on Heroku, where
the production app runs.

We're using sqlite in development and postgres in production, so
beware.

## Testing

Run: rake spec
