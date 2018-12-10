# Lani

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:8080`](http://localhost:8080) from your browser.

1. Set up automated deployment
	a. Point Google Domain to Cloudflare
	b. Set up Digital Ocean server
		i. Initial server setup (do all steps)
			- https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-16-04
		ii. Install Elixir/Phoenix, configure SSH (do steps 2,3)
		https://www.digitalocean.com/community/tutorials/how-to-automate-elixir-phoenix-deployment-with-distillery-and-edeliver-on-ubuntu-16-04
		i. Then try this guide (and see notes below)
			- https://devato.com/automate-elixir-phoenix-1-4-deployment-with-distillery-and-edeliver-on-ubuntu/
			- Step 1: After completing, initialize a git repository in your project folder. 
			- Step 2-5: skip
			- Step 7: Replace `sudo app update` with `sudo apt update`
			- Step 7: replace`pgsql` command with `psql`
			- Step 8: instead of putting prod.secret in `mkdir -p apps/phxroad/secret`, create a folders in the deploy directory called `app_config` and put prod.secret in there
			- Step 9: In the .deliver/config file, change `BUILD_AT=` to `"/home/deploy/app_build"` and `DELIVER_TO=` to `"/home/deploy/app_release"`. Also, in the `pre_erlang_get_and_update_deps` function, change `local _prod_secret_path=` to `"/home/deploy/app_config/prod.secret.exs"`
			- Step 10: Before step 9, type `echo ".deliver/releases/" >> .gitignore` command in project folder to add .deliver releases to git ignore. Then add and commit the project before deploying in step 10.
		 

		iii. Install Nginx
			- https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-16-04
		iv. Secure Nginx with SSL certificate
			- https://www.digitalocean.com/community/tutorials/how-to-set-up-let-s-encrypt-with-nginx-server-blocks-on-ubuntu-16-04
		v. Set up deployment with Distillery & Edeliver
			- 
		vi. Add pre_erlang_get_and_update_deps function to .deliver/config so Webpack can build assets
			- https://www.digitalocean.com/community/tutorials/how-to-set-up-a-node-js-application-for-production-on-ubuntu-16-04
		vii. Add Nodejs and Postgres annd Build Essentials to server
			- https://medium.com/@zek/deploy-early-and-often-deploying-phoenix-with-edeliver-and-distillery-part-one-5e91cac8d4bd
	c. Build and deploy
		- `cd ~/myproject`
		- `mix edeliver build release`
		- `mix edeliver deploy release to production`
		- `mix edeliver start production`
		- after you do the above once, you can upgrade versions by bumping up the version number in Mix.exs and using the command `mix edeliver upgrade production`
2. Add front-end dependencies
	a. Change CSS to SCSS
		i. https://elixirforum.com/t/phoenix-1-4-webpack-4-and-bulma-bootstrap-4-sass/14354/7
2. Add Bulma/Bulma Extensions/Animate.css
		ii. https://elixirforum.com/t/phoenix-1-4-webpack-4-and-bulma-bootstrap-4-sass/14354/20
3. 

References
1. Restarting Stuff
	a. Rebooting the server
		- `sudo systemctl reboot`
	b. Restart postgres
		- `sudo systemctl restart postgresql`
	c. Restart SSH
		- `sudo systemctl reload sshd`
2. Ports
	a. See what ports are listening
		- `netstat -nlt`
	b. Open port
		- `sudo ufw allow 8080`
	c. Close port
		- `ufw delete allow 8080`
3. Folder paths
	a. Postgres configs
		- `/etc/postgresql/9.5/main`
	b. Error logs
		- `/var/log/nginx/error.log`
4. Nginx users 
	a. Adding users
		- `sudo adduser user_name`
	b. Deleting users
		- `sudo userdel user_name`
		- Then remove their home directory with
		- `sudo rm -rf /home/username`
5. NPM
	a. See what version you are using
		- `npm -v`
		-	`npm install -g npm@latest`



	This is what i changed in the port settings 
	http://devopspy.com/linux/allow-remote-connections-postgresql/
	and this https://blog.bigbinary.com/2016/01/23/configure-postgresql-to-allow-remote-connection.html