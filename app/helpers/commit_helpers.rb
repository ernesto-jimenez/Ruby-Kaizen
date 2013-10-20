helpers do
  LEVELS = {
    'convention' => 0,
    'warning' => 1,
    'error' => 2,
    'fatal' => 3
  }

  def offences_by_severity(offences)
    return offences.sort{|x, y| LEVELS[x['severity']] <=> LEVELS[y['severity']]}
  end

  def offences_by_frequency(commit)
    cops = commit.rubocop.all_cop_offences_count_and_cop_names[0]
    cops.sort_by{|key, value| value}.reverse.map do |x|
      {:cop => x[0], :freq => x[1]}
    end
  end

  def humanize_cop(cop)
    cop.split(/(?=[A-Z])/).join(' ')
  end
end
