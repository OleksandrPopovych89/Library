package ap.org.ua.library.dao;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Book {
    private long bookID;
    private String bookName;
    private String author;
    private String publisher;
    private String ISBN;
    private int dateOfPublication;
    private int quantity;
}
