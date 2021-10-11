module Question

  def generate_question(mode)
    syms = [:+, :-, :*, :/, :%, :**]
    first_num = rand(25000)
    second_num = rand(25000)
    if mode === 'Easy'
      random_op = rand(0..1)
      {:question => "What does #{first_num} #{syms[random_op]} #{second_num} equal?", :answer => first_num.send(syms[random_op], second_num)}
    elsif mode === 'Medium'
      random_op = rand(2..3)
      {:question => "What does #{first_num} #{syms[random_op]} #{second_num} equal? (Round down where necessary)", :answer => first_num.send(syms[random_op], second_num)}
    else
      random_op = rand(4..5)
      {:question => "What does #{first_num} #{syms[random_op]} #{second_num} equal? (Round down where necessary)", :answer => first_num.send(syms[random_op], second_num)}
    end
  end

end