def dest_city(paths)
    # new_path = paths.flatten
    # new_path.each_with_index do |city, i|
    #     (0...paths.length - 1).each do |j|
    #         if paths[j][0] == city
    #             new_path[i] = ""
    #         end
    #     end
    # end
    # new_path.each do |city|
    #     if city != ""
    #         return city
    #     end
    # end

     new_path = paths.flatten
    cityhash = Hash.new(0)
        new_path.each do |city|
            cityhash[city] += 1
        end
    cityhash.each do |k, v|
        if v == 1
            paths.each do |sub|
                if sub[-1] == k
                    return k
                end
            end
        end
    end
end

p dest_city([["London","New York"],["New York","Lima"],["Lima","Sao Paulo"]])