CoD.WeaponGroupButton = InheritFrom( LUI.UIElement )
CoD.WeaponGroupButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WeaponGroupButton )
	self.id = "WeaponGroupButton"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 400 )
	self:setTopBottom( true, false, 0, 30 )
	
	local itemLabel = LUI.UITightText.new()
	itemLabel:setLeftRight( true, false, 5, 236 )
	itemLabel:setTopBottom( true, false, 0, 30 )
	itemLabel:setRGB( 1, 0.41, 0 )
	itemLabel:setTTF( "fonts/default.ttf" )
	self:addElement( itemLabel )
	self.itemLabel = itemLabel
	
	self.itemLabel:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				itemLabel:completeAnimation()
				self.itemLabel:setRGB( 0.43, 0.43, 0.44 )
				self.clipFinished( itemLabel, {} )
			end,
			Active = function ()
				self:setupElementClipCounter( 1 )
				itemLabel:completeAnimation()
				self.itemLabel:setRGB( 1, 0.41, 0 )
				self.clipFinished( itemLabel, {} )
			end,
			GainActive = function ()
				self:setupElementClipCounter( 1 )
				local itemLabelFrame2 = function ( itemLabel, event )
					local itemLabelFrame3 = function ( itemLabel, event )
						if not event.interrupted then
							itemLabel:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						end
						itemLabel:setRGB( 0.43, 0.43, 0.44 )
						itemLabel:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( itemLabel, event )
						else
							itemLabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						itemLabelFrame3( itemLabel, event )
						return 
					else
						itemLabel:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						itemLabel:registerEventHandler( "transition_complete_keyframe", itemLabelFrame3 )
					end
				end
				
				itemLabel:completeAnimation()
				self.itemLabel:setRGB( 0.43, 0.43, 0.44 )
				self.itemLabel:setAlpha( 1 )
				itemLabelFrame2( itemLabel, {} )
			end,
			LoseActive = function ()
				self:setupElementClipCounter( 1 )
				local itemLabelFrame2 = function ( itemLabel, event )
					if not event.interrupted then
						itemLabel:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
					end
					itemLabel:setRGB( 0.43, 0.43, 0.44 )
					if event.interrupted then
						self.clipFinished( itemLabel, event )
					else
						itemLabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemLabel:completeAnimation()
				self.itemLabel:setRGB( 1, 0.41, 0 )
				itemLabelFrame2( itemLabel, {} )
			end
		}
	}
	self.close = function ( self )
		self.itemLabel:close()
		CoD.WeaponGroupButton.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

