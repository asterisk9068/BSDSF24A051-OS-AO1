## Feature 2: Multi-file Project Report

**1. Explain the linking rule in this part's Makefile: `$(TARGET): $(OBJECTS)`. How does it differ from a Makefile rule that links against a library?**
The rule `$(TARGET): $(OBJECTS)` tells the compiler to take the individual, unlinked object files (`.o`) and combine them directly into a single executable. If we were linking against a library instead, we wouldn't list all the object files. We would use the `-L` flag to specify the library folder and the `-l` flag (e.g., `-lmyutils`) to tell the compiler to extract the compiled code from a `.a` (static) or `.so` (dynamic) file.

**2. What is a git tag and why is it useful in a project? What is the difference between a simple tag and an annotated tag?**
A git tag acts as a permanent bookmark for a specific point in a repository's history, usually used to mark version releases (like v1.0). A simple (lightweight) tag is just a pointer to a specific commit. An annotated tag, however, is stored as a full object in the Git database; it includes extra metadata like the tagger's name, email, date, and a tagging message.

**3. What is the purpose of creating a "Release" on GitHub? What is the significance of attaching binaries?**
A GitHub Release packages a specific version of the software for end users. Attaching binaries (like the `client` executable) is significant because it allows users to download and immediately run the program without needing to view the source code, install a C compiler, or know how to use `make` to build it themselves.
## Feature 3: Static Library Report

**1. [cite_start]Compare the Makefile from Part 2 and Part 3. What are the key differences in the variables and rules that enable the creation of a static library?** [cite: 694]
In Part 2, the Makefile linked all object files directly together (`$(CC) ... -o target $(OBJS)`). In Part 3, we separated the process. We added a new rule using the archiver tool (`ar rcs`) to package the utility object files into a `.a` static library variable. Then, in the linking phase, instead of listing those utility object files, we used the `-L./lib` flag to point to the library directory and `-lmyutils` to link the static library to the main object file.

**2. What is the purpose of the ar command? [cite_start]Why is ranlib often used immediately after it?** [cite: 695]
The `ar` (archiver) command is used to create, modify, and extract files from archives. In C programming, it bundles multiple `.o` object files into a single `.a` static library file. `ranlib` is often used afterward to generate an index to the contents of the archive and store it in the archive itself, which speeds up the linking process for the compiler (though modern versions of `ar` with the `s` flag do this automatically).

**3. When you run nm on your client_static executable, are the symbols for functions like mystrlen present? [cite_start]What does this tell you about how static linking works?** [cite: 696, 697]
Yes, the symbols for `mystrlen`, `mystrcpy`, etc., are present in the `client_static` executable. This proves that during static linking, the linker physically copies the compiled machine code for those functions out of the `.a` library and embeds it directly into the final executable file.
