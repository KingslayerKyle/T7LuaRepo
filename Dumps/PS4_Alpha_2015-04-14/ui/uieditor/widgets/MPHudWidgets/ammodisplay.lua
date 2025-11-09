CoD.AmmoDisplay = InheritFrom( LUI.UIElement )
CoD.AmmoDisplay.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 0
	} )
	self:setAlignment( LUI.Alignment.Right )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.AmmoDisplay )
	self.id = "AmmoDisplay"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 200 )
	self:setTopBottom( true, false, 0, 55 )
	
	local ammoStockLabel = LUI.UITightText.new()
	ammoStockLabel:setLeftRight( false, true, -60, 0 )
	ammoStockLabel:setTopBottom( true, false, 7, 55 )
	ammoStockLabel:setRGB( 1, 1, 1 )
	ammoStockLabel:setTTF( "fonts/default.ttf" )
	ammoStockLabel:subscribeToGlobalModel( controller, "CurrentWeapon", "ammoStock", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ammoStockLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( ammoStockLabel )
	self.ammoStockLabel = ammoStockLabel
	
	local slashLabel = LUI.UITightText.new()
	slashLabel:setLeftRight( false, true, -81, -60 )
	slashLabel:setTopBottom( true, false, 7, 55 )
	slashLabel:setRGB( 1, 1, 1 )
	slashLabel:setText( Engine.Localize( "/" ) )
	slashLabel:setTTF( "fonts/default.ttf" )
	self:addElement( slashLabel )
	self.slashLabel = slashLabel
	
	local ammoClipLabel = LUI.UITightText.new()
	ammoClipLabel:setLeftRight( false, true, -132, -81 )
	ammoClipLabel:setTopBottom( true, false, 7, 55 )
	ammoClipLabel:setRGB( 1, 1, 1 )
	ammoClipLabel:setTTF( "fonts/default.ttf" )
	ammoClipLabel:subscribeToGlobalModel( controller, "CurrentWeapon", "ammoInClip", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ammoClipLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( ammoClipLabel )
	self.ammoClipLabel = ammoClipLabel
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				ammoStockLabel:completeAnimation()
				self.ammoStockLabel:setRGB( 1, 1, 1 )
				self.ammoStockLabel:setAlpha( 1 )
				self.clipFinished( ammoStockLabel, {} )
				slashLabel:completeAnimation()
				self.slashLabel:setRGB( 1, 1, 1 )
				self.slashLabel:setAlpha( 1 )
				self.clipFinished( slashLabel, {} )
				ammoClipLabel:completeAnimation()
				self.ammoClipLabel:setRGB( 1, 1, 1 )
				self.ammoClipLabel:setAlpha( 1 )
				self.clipFinished( ammoClipLabel, {} )
			end
		},
		HideAmmoCounter = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				ammoStockLabel:completeAnimation()
				self.ammoStockLabel:setAlpha( 0 )
				self.clipFinished( ammoStockLabel, {} )
				slashLabel:completeAnimation()
				self.slashLabel:setAlpha( 0 )
				self.clipFinished( slashLabel, {} )
				ammoClipLabel:completeAnimation()
				self.ammoClipLabel:setAlpha( 0 )
				self.clipFinished( ammoClipLabel, {} )
			end
		},
		LowAmmo = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				ammoStockLabel:completeAnimation()
				self.ammoStockLabel:setRGB( 1, 1, 1 )
				self.ammoStockLabel:setAlpha( 1 )
				self.clipFinished( ammoStockLabel, {} )
				slashLabel:completeAnimation()
				self.slashLabel:setRGB( 1, 1, 1 )
				self.slashLabel:setAlpha( 1 )
				self.clipFinished( slashLabel, {} )
				local ammoClipLabelFrame2 = function ( ammoClipLabel, event )
					local ammoClipLabelFrame3 = function ( ammoClipLabel, event )
						if not event.interrupted then
							ammoClipLabel:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						end
						ammoClipLabel:setRGB( 1, 1, 1 )
						ammoClipLabel:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( ammoClipLabel, event )
						else
							ammoClipLabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ammoClipLabelFrame3( ammoClipLabel, event )
						return 
					else
						ammoClipLabel:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						ammoClipLabel:setRGB( 1, 0, 0 )
						ammoClipLabel:registerEventHandler( "transition_complete_keyframe", ammoClipLabelFrame3 )
					end
				end
				
				ammoClipLabel:completeAnimation()
				self.ammoClipLabel:setRGB( 1, 1, 1 )
				self.ammoClipLabel:setAlpha( 1 )
				ammoClipLabelFrame2( ammoClipLabel, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	self.close = function ( self )
		self.ammoStockLabel:close()
		self.ammoClipLabel:close()
		CoD.AmmoDisplay.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

