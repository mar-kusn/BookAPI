package pl.coderslab.service;

import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Repository;
import pl.coderslab.model.Book;
import pl.coderslab.repository.BookRepository;

import java.util.List;
import java.util.Optional;

@Repository
@Primary
public class JpaBookService implements BookService {

    private final BookRepository bookRepository;

    public JpaBookService(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }

    @Override
    public List<Book> listBooks() {
        return bookRepository.findAll();
    }

    @Override
    public Optional<Book> getBook(Long id) {
        return bookRepository.findById(id);
    }

    @Override
    public void addBook(Book book) {
        bookRepository.save(book);
    }

    @Override
    public Book updateBook(Book book) {
        bookRepository.save(book);
        return book;
    }

    @Override
    public void deleteBook(Long id) {
        bookRepository.deleteById(id);
    }
}

