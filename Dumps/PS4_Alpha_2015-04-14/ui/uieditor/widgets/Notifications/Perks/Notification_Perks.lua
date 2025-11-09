require( "ui.uieditor.widgets.Notifications.Perks.PerkInfo" )

CoD.Notification_Perks = InheritFrom( LUI.UIElement )
CoD.Notification_Perks.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Notification_Perks )
	self.id = "Notification_Perks"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 500 )
	self:setTopBottom( true, false, 0, 170 )
	self.anyChildUsesUpdateState = true
	
	local PerkInfo2 = CoD.PerkInfo.new( menu, controller )
	PerkInfo2:setLeftRight( false, true, -500, 0 )
	PerkInfo2:setTopBottom( true, false, 120, 170 )
	PerkInfo2:setRGB( 1, 1, 1 )
	PerkInfo2.DoublePerkDescription:setText( Engine.Localize( "MPUI_PERK_NOTIFY_2" ) )
	PerkInfo2:subscribeToGlobalModel( controller, "Perks", "perk2_1.image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PerkInfo2.PerkImage1:setImage( RegisterImage( modelValue ) )
		end
	end )
	PerkInfo2:subscribeToGlobalModel( controller, "Perks", "perk2_0.image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PerkInfo2.PerkImage0:setImage( RegisterImage( modelValue ) )
		end
	end )
	PerkInfo2:subscribeToGlobalModel( controller, "Perks", "perk2_0.name", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PerkInfo2.SinglePerkDescription:setText( Engine.Localize( modelValue ) )
		end
	end )
	PerkInfo2:mergeStateConditions( {
		{
			stateName = "SinglePerk",
			condition = function ( menu, element, event )
				return HasOnePerkInSlot2( controller )
			end
		},
		{
			stateName = "DoublePerk",
			condition = function ( menu, element, event )
				return HasTwoPerksInSlot2( controller )
			end
		}
	} )
	PerkInfo2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "perks.perk2_count" ), function ( model )
		menu:updateElementState( PerkInfo2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "perks.perk2_count"
		} )
	end )
	self:addElement( PerkInfo2 )
	self.PerkInfo2 = PerkInfo2
	
	local PerkInfo1 = CoD.PerkInfo.new( menu, controller )
	PerkInfo1:setLeftRight( false, true, -500, 0 )
	PerkInfo1:setTopBottom( true, false, 60, 110 )
	PerkInfo1:setRGB( 1, 1, 1 )
	PerkInfo1.DoublePerkDescription:setText( Engine.Localize( "MPUI_PERK_NOTIFY_1" ) )
	PerkInfo1:subscribeToGlobalModel( controller, "Perks", "perk1_1.image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PerkInfo1.PerkImage1:setImage( RegisterImage( modelValue ) )
		end
	end )
	PerkInfo1:subscribeToGlobalModel( controller, "Perks", "perk1_0.image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PerkInfo1.PerkImage0:setImage( RegisterImage( modelValue ) )
		end
	end )
	PerkInfo1:subscribeToGlobalModel( controller, "Perks", "perk1_0.name", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PerkInfo1.SinglePerkDescription:setText( Engine.Localize( modelValue ) )
		end
	end )
	PerkInfo1:mergeStateConditions( {
		{
			stateName = "SinglePerk",
			condition = function ( menu, element, event )
				return HasOnePerkInSlot1( controller )
			end
		},
		{
			stateName = "DoublePerk",
			condition = function ( menu, element, event )
				return HasTwoPerksInSlot1( controller )
			end
		}
	} )
	PerkInfo1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "perks.perk1_count" ), function ( model )
		menu:updateElementState( PerkInfo1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "perks.perk1_count"
		} )
	end )
	self:addElement( PerkInfo1 )
	self.PerkInfo1 = PerkInfo1
	
	local PerkInfo0 = CoD.PerkInfo.new( menu, controller )
	PerkInfo0:setLeftRight( false, true, -500, 0 )
	PerkInfo0:setTopBottom( true, false, 0, 50 )
	PerkInfo0:setRGB( 1, 1, 1 )
	PerkInfo0.DoublePerkDescription:setText( Engine.Localize( "MPUI_PERK_NOTIFY_0" ) )
	PerkInfo0:subscribeToGlobalModel( controller, "Perks", "perk0_1.image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PerkInfo0.PerkImage1:setImage( RegisterImage( modelValue ) )
		end
	end )
	PerkInfo0:subscribeToGlobalModel( controller, "Perks", "perk0_0.image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PerkInfo0.PerkImage0:setImage( RegisterImage( modelValue ) )
		end
	end )
	PerkInfo0:subscribeToGlobalModel( controller, "Perks", "perk0_0.name", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PerkInfo0.SinglePerkDescription:setText( Engine.Localize( modelValue ) )
		end
	end )
	PerkInfo0:mergeStateConditions( {
		{
			stateName = "SinglePerk",
			condition = function ( menu, element, event )
				return HasOnePerkInSlot0( controller )
			end
		},
		{
			stateName = "DoublePerk",
			condition = function ( menu, element, event )
				return HasTwoPerksInSlot0( controller )
			end
		}
	} )
	PerkInfo0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "perks.perk0_count" ), function ( model )
		menu:updateElementState( PerkInfo0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "perks.perk0_count"
		} )
	end )
	self:addElement( PerkInfo0 )
	self.PerkInfo0 = PerkInfo0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				PerkInfo2:completeAnimation()
				self.PerkInfo2:setLeftRight( false, true, -500, 0 )
				self.PerkInfo2:setTopBottom( true, false, 120, 170 )
				self.PerkInfo2:setAlpha( 1 )
				self.clipFinished( PerkInfo2, {} )
				PerkInfo1:completeAnimation()
				self.PerkInfo1:setLeftRight( false, true, -500, 0 )
				self.PerkInfo1:setTopBottom( true, false, 60, 110 )
				self.PerkInfo1:setAlpha( 1 )
				self.clipFinished( PerkInfo1, {} )
				PerkInfo0:completeAnimation()
				self.PerkInfo0:setLeftRight( false, true, -500, 0 )
				self.PerkInfo0:setTopBottom( true, false, 0, 50 )
				self.PerkInfo0:setAlpha( 1 )
				self.clipFinished( PerkInfo0, {} )
			end
		},
		Perk0 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				PerkInfo2:completeAnimation()
				self.PerkInfo2:setLeftRight( false, true, -500, 0 )
				self.PerkInfo2:setTopBottom( true, false, 170, 220 )
				self.PerkInfo2:setAlpha( 0 )
				self.clipFinished( PerkInfo2, {} )
				PerkInfo1:completeAnimation()
				self.PerkInfo1:setLeftRight( false, true, -500, 0 )
				self.PerkInfo1:setTopBottom( true, false, -50, 0 )
				self.PerkInfo1:setAlpha( 0 )
				self.clipFinished( PerkInfo1, {} )
				PerkInfo0:completeAnimation()
				self.PerkInfo0:setLeftRight( false, true, -500, 0 )
				self.PerkInfo0:setTopBottom( true, false, 60, 110 )
				self.PerkInfo0:setAlpha( 1 )
				self.clipFinished( PerkInfo0, {} )
			end
		},
		Perk0_Perk1_Perk2 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				PerkInfo2:completeAnimation()
				self.PerkInfo2:setLeftRight( false, true, -500, 0 )
				self.PerkInfo2:setTopBottom( true, false, 120, 170 )
				self.PerkInfo2:setAlpha( 1 )
				self.clipFinished( PerkInfo2, {} )
				PerkInfo1:completeAnimation()
				self.PerkInfo1:setLeftRight( false, true, -500, 0 )
				self.PerkInfo1:setTopBottom( true, false, 60, 110 )
				self.PerkInfo1:setAlpha( 1 )
				self.clipFinished( PerkInfo1, {} )
				PerkInfo0:completeAnimation()
				self.PerkInfo0:setLeftRight( false, true, -500, 0 )
				self.PerkInfo0:setTopBottom( true, false, 0, 50 )
				self.PerkInfo0:setAlpha( 1 )
				self.clipFinished( PerkInfo0, {} )
			end
		},
		Perk0_Perk1 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				PerkInfo2:completeAnimation()
				self.PerkInfo2:setLeftRight( false, true, -500, 0 )
				self.PerkInfo2:setTopBottom( true, false, 170, 220 )
				self.PerkInfo2:setAlpha( 0 )
				self.clipFinished( PerkInfo2, {} )
				PerkInfo1:completeAnimation()
				self.PerkInfo1:setLeftRight( false, true, -500, 0 )
				self.PerkInfo1:setTopBottom( true, false, 87, 137 )
				self.PerkInfo1:setAlpha( 1 )
				self.clipFinished( PerkInfo1, {} )
				PerkInfo0:completeAnimation()
				self.PerkInfo0:setLeftRight( false, true, -500, 0 )
				self.PerkInfo0:setTopBottom( true, false, 33, 83 )
				self.PerkInfo0:setAlpha( 1 )
				self.clipFinished( PerkInfo0, {} )
			end
		},
		Perk0_Perk2 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				PerkInfo2:completeAnimation()
				self.PerkInfo2:setLeftRight( false, true, -500, 0 )
				self.PerkInfo2:setTopBottom( true, false, 87, 137 )
				self.PerkInfo2:setAlpha( 1 )
				self.clipFinished( PerkInfo2, {} )
				PerkInfo1:completeAnimation()
				self.PerkInfo1:setLeftRight( false, true, -500, 0 )
				self.PerkInfo1:setTopBottom( true, false, 260, 310 )
				self.PerkInfo1:setAlpha( 0 )
				self.clipFinished( PerkInfo1, {} )
				PerkInfo0:completeAnimation()
				self.PerkInfo0:setLeftRight( false, true, -500, 0 )
				self.PerkInfo0:setTopBottom( true, false, 33, 83 )
				self.PerkInfo0:setAlpha( 1 )
				self.clipFinished( PerkInfo0, {} )
			end
		},
		Perk1 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				PerkInfo2:completeAnimation()
				self.PerkInfo2:setLeftRight( false, true, -500, 0 )
				self.PerkInfo2:setTopBottom( true, false, 170, 220 )
				self.PerkInfo2:setAlpha( 0 )
				self.clipFinished( PerkInfo2, {} )
				PerkInfo1:completeAnimation()
				self.PerkInfo1:setLeftRight( false, true, -500, 0 )
				self.PerkInfo1:setTopBottom( true, false, 60, 110 )
				self.PerkInfo1:setAlpha( 1 )
				self.clipFinished( PerkInfo1, {} )
				PerkInfo0:completeAnimation()
				self.PerkInfo0:setLeftRight( false, true, -500, 0 )
				self.PerkInfo0:setTopBottom( true, false, -50, 0 )
				self.PerkInfo0:setAlpha( 0 )
				self.clipFinished( PerkInfo0, {} )
			end
		},
		Perk1_Perk2 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				PerkInfo2:completeAnimation()
				self.PerkInfo2:setLeftRight( false, true, -500, 0 )
				self.PerkInfo2:setTopBottom( true, false, 87, 137 )
				self.PerkInfo2:setAlpha( 1 )
				self.clipFinished( PerkInfo2, {} )
				PerkInfo1:completeAnimation()
				self.PerkInfo1:setLeftRight( false, true, -500, 0 )
				self.PerkInfo1:setTopBottom( true, false, 33, 83 )
				self.PerkInfo1:setAlpha( 1 )
				self.clipFinished( PerkInfo1, {} )
				PerkInfo0:completeAnimation()
				self.PerkInfo0:setLeftRight( false, true, -500, 0 )
				self.PerkInfo0:setTopBottom( true, false, -50, 0 )
				self.PerkInfo0:setAlpha( 0 )
				self.clipFinished( PerkInfo0, {} )
			end
		},
		Perk2 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				PerkInfo2:completeAnimation()
				self.PerkInfo2:setLeftRight( false, true, -500, 0 )
				self.PerkInfo2:setTopBottom( true, false, 60, 110 )
				self.PerkInfo2:setAlpha( 1 )
				self.clipFinished( PerkInfo2, {} )
				PerkInfo1:completeAnimation()
				self.PerkInfo1:setLeftRight( false, true, -500, 0 )
				self.PerkInfo1:setTopBottom( true, false, 170, 220 )
				self.PerkInfo1:setAlpha( 0 )
				self.clipFinished( PerkInfo1, {} )
				PerkInfo0:completeAnimation()
				self.PerkInfo0:setLeftRight( false, true, -500, 0 )
				self.PerkInfo0:setTopBottom( true, false, -50, 0 )
				self.PerkInfo0:setAlpha( 0 )
				self.clipFinished( PerkInfo0, {} )
			end
		}
	}
	self.close = function ( self )
		self.PerkInfo2:close()
		self.PerkInfo1:close()
		self.PerkInfo0:close()
		CoD.Notification_Perks.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

