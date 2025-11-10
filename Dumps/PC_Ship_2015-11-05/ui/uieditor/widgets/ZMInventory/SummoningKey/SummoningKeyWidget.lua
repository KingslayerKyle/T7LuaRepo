require( "ui.uieditor.widgets.ZMInventory.SummoningKey.SummoningKeyItem" )

CoD.SummoningKeyWidget = InheritFrom( LUI.UIElement )
CoD.SummoningKeyWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SummoningKeyWidget )
	self.id = "SummoningKeyWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 112 )
	self:setTopBottom( true, false, 0, 129 )
	self.anyChildUsesUpdateState = true
	
	local SummoningKeyBg = LUI.UIImage.new()
	SummoningKeyBg:setLeftRight( true, false, -44.14, 150.61 )
	SummoningKeyBg:setTopBottom( true, false, -60, 195.14 )
	SummoningKeyBg:setAlpha( 0 )
	SummoningKeyBg:setImage( RegisterImage( "uie_t7_base_quest_key" ) )
	self:addElement( SummoningKeyBg )
	self.SummoningKeyBg = SummoningKeyBg
	
	local SummoningKeyItem = CoD.SummoningKeyItem.new( menu, controller )
	SummoningKeyItem:setLeftRight( true, false, 0, 112 )
	SummoningKeyItem:setTopBottom( true, false, 0, 129 )
	SummoningKeyItem:subscribeToGlobalModel( controller, "ZMQuestItemHolders", "used_quest_key", function ( model )
		local usedQuestKey = Engine.GetModelValue( model )
		if usedQuestKey then
			SummoningKeyItem.OtherPlayerImage:setImage( RegisterImage( GetQuestItemHolderImageFromEnum( usedQuestKey ) ) )
		end
	end )
	self:addElement( SummoningKeyItem )
	self.SummoningKeyItem = SummoningKeyItem
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				SummoningKeyBg:completeAnimation()
				self.SummoningKeyBg:setAlpha( 0 )
				self.clipFinished( SummoningKeyBg, {} )
				SummoningKeyItem:completeAnimation()
				self.SummoningKeyItem:setAlpha( 0 )
				self.clipFinished( SummoningKeyItem, {} )
			end
		},
		BgVisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				SummoningKeyBg:completeAnimation()
				self.SummoningKeyBg:setAlpha( 0 )
				self.clipFinished( SummoningKeyBg, {} )
				SummoningKeyItem:completeAnimation()
				self.SummoningKeyItem:setAlpha( 1 )
				self.clipFinished( SummoningKeyItem, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "BgVisible",
			condition = function ( menu, element, event )
				return ShowQuestItemsWidget( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_quest_items" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_quest_items"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.SummoningKeyItem:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

