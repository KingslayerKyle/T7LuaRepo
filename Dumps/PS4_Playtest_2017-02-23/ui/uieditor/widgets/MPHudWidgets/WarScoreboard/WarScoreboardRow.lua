require( "ui.uieditor.widgets.MPHudWidgets.WarScoreboard.WarScoreboardRowItem" )
require( "ui.uieditor.widgets.MPHudWidgets.WarScoreboard.WarScoreboardRowItemBonusTime" )

CoD.WarScoreboardRow = InheritFrom( LUI.UIElement )
CoD.WarScoreboardRow.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WarScoreboardRow )
	self.id = "WarScoreboardRow"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 505 )
	self:setTopBottom( 0, 0, 0, 60 )
	self.anyChildUsesUpdateState = true
	
	local zone1 = CoD.WarScoreboardRowItem.new( menu, controller )
	zone1:mergeStateConditions( {
		{
			stateName = "Shown",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThanOrEqualTo( self, controller, "progress", 1 )
			end
		}
	} )
	zone1:linkToElementModel( zone1, "progress", true, function ( model )
		menu:updateElementState( zone1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "progress"
		} )
	end )
	zone1:setLeftRight( 0, 0, 7, 173 )
	zone1:setTopBottom( 0, 0, 0, 60 )
	zone1:linkToElementModel( self, nil, false, function ( model )
		zone1:setModel( model, controller )
	end )
	zone1:linkToElementModel( self, "zone1", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			zone1.Text:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( zone1 )
	self.zone1 = zone1
	
	local zone2 = CoD.WarScoreboardRowItem.new( menu, controller )
	zone2:mergeStateConditions( {
		{
			stateName = "Shown",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThanOrEqualTo( self, controller, "progress", 2 )
			end
		}
	} )
	zone2:linkToElementModel( zone2, "progress", true, function ( model )
		menu:updateElementState( zone2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "progress"
		} )
	end )
	zone2:setLeftRight( 0, 0, 109, 275 )
	zone2:setTopBottom( 0, 0, 0, 60 )
	zone2:linkToElementModel( self, nil, false, function ( model )
		zone2:setModel( model, controller )
	end )
	zone2:linkToElementModel( self, "zone2", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			zone2.Text:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( zone2 )
	self.zone2 = zone2
	
	local zone3 = CoD.WarScoreboardRowItem.new( menu, controller )
	zone3:mergeStateConditions( {
		{
			stateName = "Shown",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThanOrEqualTo( self, controller, "progress", 3 )
			end
		}
	} )
	zone3:linkToElementModel( zone3, "progress", true, function ( model )
		menu:updateElementState( zone3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "progress"
		} )
	end )
	zone3:setLeftRight( 0, 0, 220, 386 )
	zone3:setTopBottom( 0, 0, 0, 60 )
	zone3:linkToElementModel( self, nil, false, function ( model )
		zone3:setModel( model, controller )
	end )
	zone3:linkToElementModel( self, "zone3", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			zone3.Text:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( zone3 )
	self.zone3 = zone3
	
	local bonus = CoD.WarScoreboardRowItemBonusTime.new( menu, controller )
	bonus:mergeStateConditions( {
		{
			stateName = "ShownZero",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThanOrEqualTo( self, controller, "progress", 3 ) and not IsSelfModelValueGreaterThan( self, controller, "bonus", 0 )
			end
		},
		{
			stateName = "Shown",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThanOrEqualTo( self, controller, "progress", 3 )
			end
		}
	} )
	bonus:linkToElementModel( bonus, "progress", true, function ( model )
		menu:updateElementState( bonus, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "progress"
		} )
	end )
	bonus:linkToElementModel( bonus, "bonus", true, function ( model )
		menu:updateElementState( bonus, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bonus"
		} )
	end )
	bonus:setLeftRight( 0, 0, 323, 489 )
	bonus:setTopBottom( 0, 0, -20, 80 )
	bonus:setAlpha( 0 )
	bonus.bg:setRGB( 0.26, 0.26, 0.26 )
	bonus:linkToElementModel( self, nil, false, function ( model )
		bonus:setModel( model, controller )
	end )
	bonus:linkToElementModel( self, "bonusScore", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			bonus.Text:setText( Engine.Localize( modelValue ) )
		end
	end )
	bonus:linkToElementModel( self, "bonus", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			bonus.TimeText:setText( Engine.Localize( SecondsAsTime( modelValue ) ) )
		end
	end )
	self:addElement( bonus )
	self.bonus = bonus
	
	local total = CoD.WarScoreboardRowItem.new( menu, controller )
	total:mergeStateConditions( {
		{
			stateName = "Shown",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThanOrEqualTo( self, controller, "progress", 1 )
			end
		}
	} )
	total:linkToElementModel( total, "progress", true, function ( model )
		menu:updateElementState( total, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "progress"
		} )
	end )
	total:setLeftRight( 0, 0, 347, 513 )
	total:setTopBottom( 0, 0, 0, 60 )
	total:linkToElementModel( self, nil, false, function ( model )
		total:setModel( model, controller )
	end )
	total:linkToElementModel( self, "total", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			total.Text:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( total )
	self.total = total
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.zone1:close()
		self.zone2:close()
		self.zone3:close()
		self.bonus:close()
		self.total:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

