#!/bin/bash

echo "========================================"
echo "    C++ Pattern Programs Compiler"
echo "========================================"
echo

while true; do
    echo "Choose an option:"
    echo "1. Compile a specific pattern"
    echo "2. Compile all patterns"
    echo "3. Run a pattern"
    echo "4. Clean compiled files"
    echo "5. Exit"
    echo
    read -p "Enter your choice (1-5): " choice

    case $choice in
        1)
            echo
            read -p "Enter pattern number (1-19): " pattern
            if [ -f "pattern$pattern.cpp" ]; then
                echo "Compiling pattern$pattern.cpp..."
                g++ -o pattern$pattern pattern$pattern.cpp
                if [ $? -eq 0 ]; then
                    echo "Successfully compiled pattern$pattern"
                else
                    echo "Compilation failed!"
                fi
            else
                echo "pattern$pattern.cpp not found!"
            fi
            echo
            read -p "Press Enter to continue..."
            ;;
        2)
            echo
            echo "Compiling all patterns..."
            for file in pattern*.cpp; do
                if [ -f "$file" ]; then
                    basename=$(basename "$file" .cpp)
                    echo "Compiling $file..."
                    g++ -o "$basename" "$file"
                fi
            done
            echo "All patterns compiled!"
            echo
            read -p "Press Enter to continue..."
            ;;
        3)
            echo
            read -p "Enter pattern number to run (1-19): " pattern
            if [ -f "pattern$pattern" ]; then
                echo "Running pattern$pattern..."
                echo "Enter the size when prompted:"
                ./pattern$pattern
            else
                echo "pattern$pattern not found! Compile it first."
            fi
            echo
            read -p "Press Enter to continue..."
            ;;
        4)
            echo
            echo "Cleaning compiled files..."
            rm -f pattern[0-9]* 2>/dev/null
            echo "Cleaned!"
            echo
            read -p "Press Enter to continue..."
            ;;
        5)
            echo "Thank you for using the Pattern Compiler!"
            exit 0
            ;;
        *)
            echo "Invalid choice. Please try again."
            echo
            ;;
    esac
done