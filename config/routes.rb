Rails.application.routes.draw do
  devise_for :users
  root 'notes#index'
  #root 'welcome#hello'

  resources :notes, only: [:index, :new, :create, :show, :edit, :update]
  #get "/notes", to: "notes#index", as: :notes
  # notes_path() => '/notes'
  # notes_url() => 'http://localhost:3000:notes'
  #get "/notes/new", to: "notes#new", as: :new_note
  # new_note_path() => '/notes/new'
  # new_note_url() => 'http://localhost:3000/notes/new'
  #post "/notes", to: "notes#create"
  #get "/notes/:id", to: "notes#show", as: :note
  # note_path(note.id) => '/notes/2'
  # note_url(note.id) => 'http://localhost:3000/notes/2'
  get "welcome/hello/(/:message)", to: "welcome#hello", as: :hello_welcome
  get "welcome/goodby", to: "welcome#goodby"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
