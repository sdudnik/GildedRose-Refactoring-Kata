class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality(items)
    items.each do |item|
      case item.name
      when "Aged Brie"
        update_aged_brie_quality(item)
      when "Sulfuras"
        update_sulfuras_quality(item)
      when "Backstage passes"
        update_backstage_passes_quality(item)
      when "Conjured"
        update_conjured_quality(item)
      else
        update_standard_quality(item)
      end

      item.sell_in -= 1
    end
  end

  def update_standard_quality(item)
    item.quality -= 1
    item.quality -= 1 if item.sell_in < 0
  end

  def update_aged_brie_quality(item)
    item.quality += 1
  end

  def update_sulfuras_quality(item)
    # Do nothing
  end

  def update_backstage_passes_quality(item)
    if item.sell_in <= 10
      item.quality += 3
    elsif item.sell_in <= 5
      item.quality += 2
    else
      item.quality -= 1
    end

    item.quality = 0 if item.sell_in < 0
  end

  def update_conjured_quality(item)
    item.quality -= 2
    item.quality -= 2 if item.sell_in < 0
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
