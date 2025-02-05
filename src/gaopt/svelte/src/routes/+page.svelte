<script>
    import { onMount } from 'svelte';
  
    let participants = 3;
    let dimensions = 4;
    let errorMessage = '';
  
    async function startGame() {
      if (participants < 3) {
        errorMessage = 'At least 3 participants are required.';
        return;
      }
      if (dimensions < 4 || dimensions > 10) {
        errorMessage = 'Dimensions must be between 4 and 10.';
        return;
      }
      errorMessage = '';
  
      try {
        const response = await fetch('/api/start-game', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({ participants, dimensions }),
        });
  
        if (response.ok) {
          window.location.href = '/initial-setup';
        } else {
          const data = await response.json();
          errorMessage = data.error || 'Failed to start the game. Please try again.';
        }
      } catch (error) {
        console.error('Error starting game:', error);
        errorMessage = 'An error occurred. Please try again.';
      }
    }
  
    // onMount(() => {
    //   // Any initialization code can go here
    // });
  </script>
  
  <main class="container mx-auto p-4 max-w-md">
    <h1 class="source-code-pro">GAOpt</h1>
  
    <div class="mb-4">
      <label for="participants" class="block mb-2 font-medium">
        Number of Participants (3 or more):
      </label>
      <input
        type="number"
        id="participants"
        bind:value={participants}
        min="3"
        class="w-full p-2 border rounded"
      />
    </div>
  
    <div class="mb-4">
      <label for="dimensions" class="block mb-2 font-medium">
        Number of Dimensions (4-10):
      </label>
      <input
        type="number"
        id="dimensions"
        bind:value={dimensions}
        min="4"
        max="10"
        class="w-full p-2 border rounded"
      />
    </div>
  
    <table class="w-full mb-4 border-collapse border">
      <thead>
        <tr>
          <th class="border p-2">Participant</th>
          <th class="border p-2">Dimensions</th>
        </tr>
      </thead>
      <tbody>
        {#each Array(participants) as _, i}
          <tr>
            <td class="border p-2">Participant {i + 1}</td>
            <td class="border p-2">{dimensions}</td>
          </tr>
        {/each}
      </tbody>
    </table>
  
    {#if errorMessage}
      <p class="text-red-500 mb-4">{errorMessage}</p>
    {/if}
  
    <button
      on:click={startGame}
      class="w-full bg-blue-500 text-white p-2 rounded hover:bg-blue-600 transition-colors"
    >
      Start Game
    </button>
  </main>
  
  <style>
    :global(body) {
      background-color: #f0f0f0;
      font-family: source-code-pro;
    }

    .source-code-pro {
        font-family: "Source Code Pro", monospace;
        font-optical-sizing: auto;
        font-weight: 600;
        font-style: normal;
    }
  </style>