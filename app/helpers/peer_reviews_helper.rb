module PeerReviewsHelper
  HEADER_TO_DESCRIPTION = {
    'Team Player'               => 'Treats teammates with respect.  Solicits and incorporates input from teammates.  Able and willing to compromise position when teammates hold differing position with compelling rationale.',
    'Agile Mindset'             => 'Values incremental release and testing over thorough planning and detailed requirements.  Willing to push forward despite uncertainty.  Willing to adapt to changing requirements as additional information surfaces.',
    'Productivity'              => 'Manages distractions and maintains high level of productivity.  Writes code efficiently to solve real problems.  Strong individual contributor to team projects.',
    'Attention to Code Quality' => 'Values high internal quality of codebase.  Understands fundamentals and application of good architecture.  Advocates clean code to team.  Refactors when needed.',
    'Initiative to Improve'     => 'Actively seeks to identify improvements and innovate.  Explores better ways of solving problems. Included but not limited to areas such as product (product ideas aimed toward increasing value delivered to customer), technology (faster delivery/better performance), and codebase (reducing technical debt, architectural integrity).',
    'Active Participant'        => "Voices opinions about technical and product tradeoffs.  Bases opinions on evidence and experience, not emotions or unsubstantiated opinions of others.  Presents opinions rationally and objectively, being respectful of others' opinions.",
    'Data Driven'               => 'Identifies and implements monitoring of key performance indicators.  Ensures every feature is instrumented and monitored.  Advocates for data-driven decisions over subjectivity.  Advocates and invests in analytics infrastructure.',
    'Communication'             => 'Is able to effectively communicate issues and the current state of projects to peers, cross-teams and upper management (Knows who their audience is and communicates appropriately).',
    'Customer Focus'            => "Prioritizes customer input and validation above opinions.  Analyzes product tradeoffs from customer's perspective.  Actively seeks to minimize customer pain and solve real problems.",
    'Ruby'                      => "Proficient with Ruby.  Understands Ruby syntax, semantics, and core API's.",
    'Rails'                     => "Understands Rails conventions and best practices.  Understands Rails strengths and weaknesses.  Writes code that plays to Rails strengths and avoids weaknesses.",
    'HTML and CSS'              => 'Proficient with HTML and CSS.  Understands fundamentals and implementation details of responsive design.  Understands and uses semantic markup and scalable CSS architecture.',
    'Javascript'                => 'Proficient with javascript.  Understands best practices for structuring javascript code.  Implements efficient code and uses best practices for asynchronous browser loading.',
    'Networking'                => 'Understands networking fundamentals including protocols and common implementations.  Appreciates strengths and weaknesses of different networking technologies.  Applies best practices to use of networking technologies.',
    'Databases'                 => 'Understands schema and table structures, query syntax, foreign key relations, transactions, and best practices for designing both queries and tables.',
    'Tools'                     => 'Proficient with tools such as CI, Rubymine, and Git.  Understands how and when to use tools as well as their limitations.  Advises others about proper use of tools.',
    'Testing Practices'         => 'Knows when to use different types of testing methodologies and what types of tests to write. Writes high-quality tests.  Understands when and how to use mocks, stubs, exemplars, and service objects in test code.',
    'Knowledge of Products'     => 'Understands the breadth and depth of Appfolio products.  Knowledgable about their use as well as implementation.  Understands product roadmaps and major initiatives.',
    'Overall Distribution'      => 'This shows how many attributes were rated at each level across all the questions.'
  }.freeze

  def description_for(header)
    HEADER_TO_DESCRIPTION[header]
  end
end
