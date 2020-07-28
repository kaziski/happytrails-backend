# Happy Trails!

I love discovering new trails, and sharing information about them with friends. I wanted a yelp-like app that allows me to find trails by an address, let me save trails for me to view later, and /or write a review of trails. I couldn't find an app that does all those things, so I created [Happy Trails](https://happytrails.surge.sh/)!

Here is the [demo](https://happytrails.surge.sh/).<br>
You can use Username: Tester<br>
Password: 123456 to try out the app if you don't want to sign up.

[The front end](https://github.com/codingmamakaz/happytrails-frontend) was developed with ReactJS / Redux / Thunk, Bulma to handle front-end and state management.<br>
It fetches data from Hiking Project Data API, uses Google Geocoding API to allow users to search trails.<br>
The backend handles the data persistence.

**Note:**
This is the backend Rails API of the project.

## Using Happy Trails

You need to clone this repo and [The front end repo](https://github.com/codingmamakaz/happytrails-frontend).
Once you clone both repos,

### `bundle install`

Install the dependencies specified in the Gemfile.

### `rails s`

Runs the backend Rails API in the development mode.<br>
Open [http://localhost:3000](http://localhost:3000)

To run the front end, 
### `npm start`

Runs the app in the development mode.<br>
Open [http://localhost:3001](http://localhost:3001) to view it in the browser.

The page will reload if you make edits.<br>
You will also see any lint errors in the console.


## Contributing to Happy Trails

To contribute to Happy Trails, follow these steps:

1. Fork this repository.
2. Create a branch: git checkout -b <branch_name>.
3. Make your changes and commit them: git commit -m '<commit_message>'
4. Push to the original branch: git push origin <project_name>/<location>
5. Create the pull request.
  Alternatively see the GitHub documentation on [creating a pull request.](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request)
  
## Contact
If you want to contact me you can reach me at kazumikarbowski@gmail.com

## licence 
Please read [here](https://opensource.org/licenses/MIT)
