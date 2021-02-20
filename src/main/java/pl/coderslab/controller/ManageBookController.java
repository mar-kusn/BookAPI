package pl.coderslab.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.model.Book;
import pl.coderslab.service.BookService;

import javax.persistence.EntityNotFoundException;
import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/admin/books")
public class ManageBookController {

    private final BookService bookService;

    public ManageBookController(BookService bookService) {
        this.bookService = bookService;
    }

    @GetMapping("/all")
    public String listBooks(Model model) {
        List<Book> books = bookService.getBooks();
        model.addAttribute("books", books);
        return "/books/all";
    }

    @GetMapping("/add")
    public String addBookFormShow(Model model) {
        model.addAttribute("book", new Book());
        return "/books/add-form";
    }

    @PostMapping("/add")
    public String addBookPerform(@Valid Book book, BindingResult result) {
        if (result.hasErrors()) {
            return "/books/add-form";
        }
        this.bookService.addBook(book);

        return "redirect:/admin/books/all";
    }

    @GetMapping("/edit/{bookId}")
    public String editBookFormShow(@PathVariable Long bookId, Model model) {

        model.addAttribute("book", this.bookService.getBook(bookId));
        return "/books/edit-form";
    }

    @PostMapping("/edit/{bookId}")
    public String editBookPerform(@Valid Book book, BindingResult result) {
        if (result.hasErrors()) {
            return "/edit/edit-form";
        }
        this.bookService.updateBook(book);

        return "redirect:/admin/books/all";
    }

    @GetMapping("/delete/{bookId}")
    public String delete(@PathVariable Long bookId,  Model model) {

        model.addAttribute("book", bookService.getBook(bookId).orElse(new Book()));// .orElseThrow(EntityNotFoundException::new));
        //model.addAttribute("book", bookService.getBook(bookId).orElseThrow(EntityNotFoundException::new));
//        model.addAttribute("book", this.bookService.getBook(bookId));

        return "/books/delete-form";
    }

    @PostMapping("/delete/{bookId}")
    public String deletePost(@PathVariable Long bookId, @RequestParam String deleteBtn) {

        if (deleteBtn.equals("yes")) {
            this.bookService.deleteBook(bookId);
        }

        return "redirect:/admin/books/all";
    }

    @GetMapping("/show/{bookId}")
    public String showBook(@PathVariable Long bookId,  Model model) {

        model.addAttribute("book", bookService.getBook(bookId).orElse(new Book()));

        return "/books/show";
    }
}
