// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title blockchain - Simple chain memory (beginner)
/// @author
/// @notice Very small demo contract to store short text "memories" on-chain.
contract blockchain {
    struct Memory {
        address author;      // who added it
        uint256 timestamp;   // when added
        string data;         // the memory text
    }

    Memory[] private memories;
    address public owner;

    event MemoryAdded(uint256 indexed index, address indexed author, uint256 timestamp, string data);
    event MemoryUpdated(uint256 indexed index, address indexed author, uint256 timestamp, string newData);
    event MemoryRemoved(uint256 indexed index, address indexed removedBy);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner allowed");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    /// @notice Add a new memory (anyone can call)
    /// @param _data short text to store
    function addMemory(string calldata _data) external {
        memories.push(Memory({
            author: msg.sender,
            timestamp: block.timestamp,
            data: _data
        }));

        uint256 idx = memories.length - 1;
        emit MemoryAdded(idx, msg.sender, block.timestamp, _data);
    }

    /// @notice Read a memory by index
    /// @param index index in array (0-based)
    function getMemory(uint256 index) external view returns (address author, uint256 timestamp, string memory data) {
        require(index < memories.length, "Index out of bounds");
        Memory storage m = memories[index];
        return (m.author, m.timestamp, m.data);
    }

    /// @notice Return how many memories exist
    function count() external view returns (uint256) {
        return memories.length;
    }

    /// @notice Return all memories (use with care — can be expensive off-chain; ok for demos)
    function getAll() external view returns (Memory[] memory) {
        return memories;
    }

    /// @notice Update a memory's text — only the original author can update their memory
    function updateMemory(uint256 index, string calldata _newData) external {
        require(index < memories.length, "Index out of bounds");
        Memory storage m = memories[index];
        require(m.author == msg.sender, "Only author can update");
        m.data = _newData;
        emit MemoryUpdated(index, msg.sender, block.timestamp, _newData);
    }

    /// @notice Owner-only helper to remove the last memory (pop)
    function removeLastMemory() external onlyOwner {
        require(memories.length > 0, "No memories to remove");
        uint256 idx = memories.length - 1;
        memories.pop();
        emit MemoryRemoved(idx, msg.sender);
    }
}

