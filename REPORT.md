## Feature 2: Multi-file Project Report

**1. Explain the linking rule in this part's Makefile: `$(TARGET): $(OBJECTS)`. How does it differ from a Makefile rule that links against a library?**
The rule `$(TARGET): $(OBJECTS)` tells the compiler to take the individual, unlinked object files (`.o`) and combine them directly into a single executable. If we were linking against a library instead, we wouldn't list all the object files. We would use the `-L` flag to specify the library folder and the `-l` flag (e.g., `-lmyutils`) to tell the compiler to extract the compiled code from a `.a` (static) or `.so` (dynamic) file.

**2. What is a git tag and why is it useful in a project? What is the difference between a simple tag and an annotated tag?**
A git tag acts as a permanent bookmark for a specific point in a repository's history, usually used to mark version releases (like v1.0). A simple (lightweight) tag is just a pointer to a specific commit. An annotated tag, however, is stored as a full object in the Git database; it includes extra metadata like the tagger's name, email, date, and a tagging message.

**3. What is the purpose of creating a "Release" on GitHub? What is the significance of attaching binaries?**
A GitHub Release packages a specific version of the software for end users. Attaching binaries (like the `client` executable) is significant because it allows users to download and immediately run the program without needing to view the source code, install a C compiler, or know how to use `make` to build it themselves.
