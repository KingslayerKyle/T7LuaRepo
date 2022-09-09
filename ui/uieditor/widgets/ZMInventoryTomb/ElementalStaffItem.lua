-- 4973889ce7a3386fc4fec025942e8807
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.onOffImage" )

CoD.ElementalStaffItem = InheritFrom( LUI.UIElement )
CoD.ElementalStaffItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ElementalStaffItem )
	self.id = "ElementalStaffItem"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 100 )
	self:setTopBottom( true, false, 0, 132 )
	self.anyChildUsesUpdateState = true
	
	local StaffPartL = CoD.onOffImage.new( menu, controller )
	StaffPartL:setLeftRight( false, true, -73, 23 )
	StaffPartL:setTopBottom( false, false, -5.75, 90.25 )
	StaffPartL.image:setImage( RegisterImage( "uie_t7_zm_hd_craftable_inventory_fill_bottom" ) )
	StaffPartL:linkToElementModel( self, nil, false, function ( model )
		StaffPartL:setModel( model, controller )
	end )
	StaffPartL:mergeStateConditions( {
		{
			stateName = "On",
			condition = function ( menu, element, event )
				return not IsSelfModelValueNilOrZero( element, controller, "piece_zm_lstaff" )
			end
		}
	} )
	StaffPartL:linkToElementModel( StaffPartL, "piece_zm_lstaff", true, function ( model )
		menu:updateElementState( StaffPartL, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "piece_zm_lstaff"
		} )
	end )
	self:addElement( StaffPartL )
	self.StaffPartL = StaffPartL
	
	local StaffPartU = CoD.onOffImage.new( menu, controller )
	StaffPartU:setLeftRight( false, true, -72, 24 )
	StaffPartU:setTopBottom( false, false, -86.75, 9.25 )
	StaffPartU.image:setImage( RegisterImage( "uie_t7_zm_hd_craftable_inventory_fill_top" ) )
	StaffPartU:linkToElementModel( self, nil, false, function ( model )
		StaffPartU:setModel( model, controller )
	end )
	StaffPartU:mergeStateConditions( {
		{
			stateName = "On",
			condition = function ( menu, element, event )
				return not IsSelfModelValueNilOrZero( element, controller, "piece_zm_ustaff" )
			end
		}
	} )
	StaffPartU:linkToElementModel( StaffPartU, "piece_zm_ustaff", true, function ( model )
		menu:updateElementState( StaffPartU, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "piece_zm_ustaff"
		} )
	end )
	self:addElement( StaffPartU )
	self.StaffPartU = StaffPartU
	
	local StaffPartM = CoD.onOffImage.new( menu, controller )
	StaffPartM:setLeftRight( false, true, -73, 23 )
	StaffPartM:setTopBottom( false, false, -43.25, 52.75 )
	StaffPartM.image:setImage( RegisterImage( "uie_t7_zm_hd_craftable_inventory_fill_middle" ) )
	StaffPartM:linkToElementModel( self, nil, false, function ( model )
		StaffPartM:setModel( model, controller )
	end )
	StaffPartM:mergeStateConditions( {
		{
			stateName = "On",
			condition = function ( menu, element, event )
				return not IsSelfModelValueNilOrZero( element, controller, "piece_zm_mstaff" )
			end
		}
	} )
	StaffPartM:linkToElementModel( StaffPartM, "piece_zm_mstaff", true, function ( model )
		menu:updateElementState( StaffPartM, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "piece_zm_mstaff"
		} )
	end )
	self:addElement( StaffPartM )
	self.StaffPartM = StaffPartM
	
	local staffPartSeparator = LUI.UIImage.new()
	staffPartSeparator:setLeftRight( false, true, -48, 0 )
	staffPartSeparator:setTopBottom( false, false, -69.75, 74.25 )
	staffPartSeparator:setImage( RegisterImage( "uie_t7_zm_hd_craftable_inventory_divider" ) )
	self:addElement( staffPartSeparator )
	self.staffPartSeparator = staffPartSeparator
	
	local staffPartFg = LUI.UIImage.new()
	staffPartFg:setLeftRight( false, true, -48, 0 )
	staffPartFg:setTopBottom( false, false, -69.75, 74.25 )
	staffPartFg:setImage( RegisterImage( "uie_t7_zm_hd_craftable_inventory_base" ) )
	self:addElement( staffPartFg )
	self.staffPartFg = staffPartFg
	
	local Record = LUI.UIImage.new()
	Record:setLeftRight( true, false, -4.75, 70.75 )
	Record:setTopBottom( false, false, -35.5, 40 )
	Record:setImage( RegisterImage( "uie_t7_zm_icon_hd_musicalpart_2" ) )
	self:addElement( Record )
	self.Record = Record
	
	local Staff = LUI.UIImage.new()
	Staff:setLeftRight( false, false, -40, 92 )
	Staff:setTopBottom( false, false, -66, 66 )
	Staff:setImage( RegisterImage( "uie_t7_zm_hd_craftable_staff_fire" ) )
	self:addElement( Staff )
	self.Staff = Staff
	
	local UpgradedStaff = LUI.UIImage.new()
	UpgradedStaff:setLeftRight( false, false, -40, 92 )
	UpgradedStaff:setTopBottom( false, false, -66, 66 )
	UpgradedStaff:setImage( RegisterImage( "uie_t7_zm_hd_craftable_staff_fire_outline" ) )
	self:addElement( UpgradedStaff )
	self.UpgradedStaff = UpgradedStaff
	
	local Gem = LUI.UIImage.new()
	Gem:setLeftRight( true, false, -10.75, 64.75 )
	Gem:setTopBottom( false, false, -35.5, 40 )
	Gem:setImage( RegisterImage( "uie_t7_zm_hd_craftable_crystal_fire" ) )
	self:addElement( Gem )
	self.Gem = Gem
	
	local PlayerImage = LUI.UIImage.new()
	PlayerImage:setLeftRight( true, false, 0, 42.24 )
	PlayerImage:setTopBottom( true, false, 89.76, 132 )
	PlayerImage:linkToElementModel( self, "holder", true, function ( model )
		local holder = Engine.GetModelValue( model )
		if holder then
			PlayerImage:setImage( RegisterImage( GetCastleQuestOwnerImageFromEnum( holder ) ) )
		end
	end )
	self:addElement( PlayerImage )
	self.PlayerImage = PlayerImage
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )

				StaffPartL:completeAnimation()
				self.StaffPartL:setAlpha( 1 )
				self.clipFinished( StaffPartL, {} )

				StaffPartU:completeAnimation()
				self.StaffPartU:setAlpha( 1 )
				self.clipFinished( StaffPartU, {} )

				StaffPartM:completeAnimation()
				self.StaffPartM:setAlpha( 1 )
				self.clipFinished( StaffPartM, {} )

				Record:completeAnimation()
				self.Record:setAlpha( 0 )
				self.clipFinished( Record, {} )

				Staff:completeAnimation()
				self.Staff:setAlpha( 0 )
				self.clipFinished( Staff, {} )

				UpgradedStaff:completeAnimation()
				self.UpgradedStaff:setAlpha( 0 )
				self.clipFinished( UpgradedStaff, {} )

				Gem:completeAnimation()
				self.Gem:setAlpha( 0 )
				self.clipFinished( Gem, {} )

				PlayerImage:completeAnimation()
				self.PlayerImage:setAlpha( 0 )
				self.clipFinished( PlayerImage, {} )
			end
		},
		HaveUpgradedStaff = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )

				StaffPartL:completeAnimation()
				self.StaffPartL:setAlpha( 0 )
				self.clipFinished( StaffPartL, {} )

				StaffPartU:completeAnimation()
				self.StaffPartU:setAlpha( 0 )
				self.clipFinished( StaffPartU, {} )

				StaffPartM:completeAnimation()
				self.StaffPartM:setAlpha( 0 )
				self.clipFinished( StaffPartM, {} )

				staffPartFg:completeAnimation()
				self.staffPartFg:setAlpha( 0 )
				self.clipFinished( staffPartFg, {} )

				Record:completeAnimation()
				self.Record:setAlpha( 0 )
				self.clipFinished( Record, {} )

				Staff:completeAnimation()
				self.Staff:setAlpha( 1 )
				self.clipFinished( Staff, {} )

				UpgradedStaff:completeAnimation()
				self.UpgradedStaff:setAlpha( 1 )
				self.clipFinished( UpgradedStaff, {} )

				Gem:completeAnimation()
				self.Gem:setAlpha( 1 )
				self.clipFinished( Gem, {} )

				PlayerImage:completeAnimation()
				self.PlayerImage:setAlpha( 1 )
				self.clipFinished( PlayerImage, {} )
			end
		},
		HaveStaff = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )

				StaffPartL:completeAnimation()
				self.StaffPartL:setAlpha( 0 )
				self.clipFinished( StaffPartL, {} )

				StaffPartU:completeAnimation()
				self.StaffPartU:setAlpha( 0 )
				self.clipFinished( StaffPartU, {} )

				StaffPartM:completeAnimation()
				self.StaffPartM:setAlpha( 0 )
				self.clipFinished( StaffPartM, {} )

				staffPartFg:completeAnimation()
				self.staffPartFg:setAlpha( 0 )
				self.clipFinished( staffPartFg, {} )

				Record:completeAnimation()
				self.Record:setAlpha( 0 )
				self.clipFinished( Record, {} )

				Staff:completeAnimation()
				self.Staff:setAlpha( 1 )
				self.clipFinished( Staff, {} )

				UpgradedStaff:completeAnimation()
				self.UpgradedStaff:setAlpha( 0 )
				self.clipFinished( UpgradedStaff, {} )

				Gem:completeAnimation()
				self.Gem:setAlpha( 1 )
				self.clipFinished( Gem, {} )

				PlayerImage:completeAnimation()
				self.PlayerImage:setAlpha( 1 )
				self.clipFinished( PlayerImage, {} )
			end
		},
		HaveGem = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				StaffPartL:completeAnimation()
				self.StaffPartL:setAlpha( 1 )
				self.clipFinished( StaffPartL, {} )

				StaffPartU:completeAnimation()
				self.StaffPartU:setAlpha( 1 )
				self.clipFinished( StaffPartU, {} )

				StaffPartM:completeAnimation()
				self.StaffPartM:setAlpha( 1 )
				self.clipFinished( StaffPartM, {} )

				Record:completeAnimation()
				self.Record:setAlpha( 0 )
				self.clipFinished( Record, {} )

				Staff:completeAnimation()
				self.Staff:setAlpha( 0 )
				self.clipFinished( Staff, {} )

				Gem:completeAnimation()
				self.Gem:setAlpha( 1 )
				self.clipFinished( Gem, {} )

				PlayerImage:completeAnimation()
				self.PlayerImage:setAlpha( 1 )
				self.clipFinished( PlayerImage, {} )
			end
		},
		HaveRecord = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )

				StaffPartL:completeAnimation()
				self.StaffPartL:setAlpha( 1 )
				self.clipFinished( StaffPartL, {} )

				StaffPartU:completeAnimation()
				self.StaffPartU:setAlpha( 1 )
				self.clipFinished( StaffPartU, {} )

				StaffPartM:completeAnimation()
				self.StaffPartM:setAlpha( 1 )
				self.clipFinished( StaffPartM, {} )

				Record:completeAnimation()
				self.Record:setAlpha( 1 )
				self.clipFinished( Record, {} )

				Staff:completeAnimation()
				self.Staff:setAlpha( 0 )
				self.clipFinished( Staff, {} )

				UpgradedStaff:completeAnimation()
				self.UpgradedStaff:setAlpha( 0 )
				self.clipFinished( UpgradedStaff, {} )

				Gem:completeAnimation()
				self.Gem:setAlpha( 0 )
				self.clipFinished( Gem, {} )

				PlayerImage:completeAnimation()
				self.PlayerImage:setAlpha( 0 )
				self.clipFinished( PlayerImage, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "HaveUpgradedStaff",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "quest_state", CoD.Zombie.TOMB_STAFF_QUEST_STATE_GOT_UPGRADE )
			end
		},
		{
			stateName = "HaveStaff",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "quest_state", CoD.Zombie.TOMB_STAFF_QUEST_STATE_MADE_STAFF )
			end
		},
		{
			stateName = "HaveGem",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "quest_state", CoD.Zombie.TOMB_STAFF_QUEST_STATE_GOT_CRYSTAL )
			end
		},
		{
			stateName = "HaveRecord",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "quest_state", CoD.Zombie.TOMB_STAFF_QUEST_STATE_GOT_RECORD )
			end
		}
	} )
	self:linkToElementModel( self, "quest_state", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "quest_state"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StaffPartL:close()
		element.StaffPartU:close()
		element.StaffPartM:close()
		element.PlayerImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
