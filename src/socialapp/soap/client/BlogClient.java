package socialapp.soap.client;

import java.rmi.RemoteException;
import java.util.Scanner;

import javax.xml.rpc.ServiceException;

public class BlogClient {

	private static final Scanner keyboard = new Scanner(System.in);

	public static void main(String[] args) throws ServiceException,
			RemoteException {
		BlogServiceLocator locator = new BlogServiceLocator();
		Blog blog = locator.getBlogPort();
		System.out.print("Enter email: ");
		String email = keyboard.nextLine();
		User user = blog.getUser(email);
		if (user != null) {
			System.out
					.print("Enter option (type 'v' to view list of blogs, type 'd' to delete a article, or 'x' to exit): ");
			String choice = keyboard.nextLine();
			while (choice != "x") {
				if (choice.equals("v")) {
					for (socialapp.soap.client.Article a : blog.getBlogs(user)) {
						System.out.println(a.getTitle() + ", " + a.getDate());
					}
				} else if (choice.equals("d")) {
					System.out.print("Enter the title of the article: ");
					String title = keyboard.nextLine();
					blog.deleteArticle(user, title);
				} else if (choice.equals("x")) {
					System.out.print("");
				} else {
					System.out.print("Invalid.");
				}
				System.out
						.print("Enter option (type 'v' to view list of blogs, type 'd' to delete a article, or 'x' to exit): ");
				choice = keyboard.nextLine();
			}
		} else {
			System.out.print("Login failed.");
		}

	}
}