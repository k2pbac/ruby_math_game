module Question

  def generate_question(mode)
    if mode === 'Easy'
     first_num = rand(101)
     second_num = rand(101)
     random_question = rand(2)
     easy_question = 
     [
       {"question" => "What does #{first_num} + #{second_num} equal?", "answer" => first_num+second_num}, 
       {"question" => "What does #{first_num} - #{second_num} equal?", "answer" => first_num-second_num}
     ]
     easy_question[random_question]
    end
  end

end