require( "ui.uieditor.widgets.Prestige.Prestige_ParagonMilestoneIcon" )

DataSources.PrestigeMasterTiers = DataSourceHelpers.ListSetup( "PrestigeMasterTiers", function ( controller )
	local iconTable = {}
	for i = 1, CoD.PrestigeUtility.PRESTIGE_MASTER_MAX_TIERS, 1 do
		table.insert( iconTable, {
			models = {
				id = i
			}
		} )
	end
	return iconTable
end )
CoD.Prestige_MasterTierWidget = InheritFrom( LUI.UIElement )
CoD.Prestige_MasterTierWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Prestige_MasterTierWidget )
	self.id = "Prestige_MasterTierWidget"
	self.soundSet = "AAR"
	self:setLeftRight( 0, 0, 0, 384 )
	self:setTopBottom( 0, 0, 0, 36 )
	self.anyChildUsesUpdateState = true
	
	local Bar = LUI.UIImage.new()
	Bar:setLeftRight( 0, 1, 0, 0 )
	Bar:setTopBottom( 0, 0, 0, 6 )
	Bar:setRGB( 0.92, 0.64, 0.15 )
	Bar:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	Bar:setShaderVector( 0, 0, 0.4, 0, 0.4 )
	self:addElement( Bar )
	self.Bar = Bar
	
	local ParagonStars = LUI.GridLayout.new( menu, controller, false, 0, 0, 4, 0, nil, nil, false, false, 0, 0, false, false )
	ParagonStars:setLeftRight( 0, 0, 11, 287 )
	ParagonStars:setTopBottom( 1, 1, -33, -9 )
	ParagonStars:setWidgetType( CoD.Prestige_ParagonMilestoneIcon )
	ParagonStars:setHorizontalCount( 10 )
	ParagonStars:setSpacing( 4 )
	ParagonStars:setDataSource( "PrestigeMasterTiers" )
	LUI.OverrideFunction_CallOriginalFirst( ParagonStars, "setState", function ( element, state )
		UpdateDataSource( self, element, controller )
	end )
	self:addElement( ParagonStars )
	self.ParagonStars = ParagonStars
	
	local Bar2 = LUI.UIImage.new()
	Bar2:setLeftRight( 0, 1, 0, 0 )
	Bar2:setTopBottom( 0, 0, -3, 12 )
	Bar2:setRGB( 1, 0.75, 0.3 )
	Bar2:setImage( RegisterImage( "uie_t7_icon_mp_masterprestige_rankbar" ) )
	Bar2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	Bar2:setShaderVector( 0, 0, 0.4, 0, 0.4 )
	self:addElement( Bar2 )
	self.Bar2 = Bar2
	
	self.resetProperties = function ()
		ParagonStars:completeAnimation()
		Bar:completeAnimation()
		Bar2:completeAnimation()
		ParagonStars:setAlpha( 1 )
		Bar:setAlpha( 1 )
		Bar2:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				Bar:completeAnimation()
				self.Bar:setAlpha( 0 )
				self.clipFinished( Bar, {} )
				ParagonStars:completeAnimation()
				self.ParagonStars:setAlpha( 0 )
				self.clipFinished( ParagonStars, {} )
				Bar2:completeAnimation()
				self.Bar2:setAlpha( 0 )
				self.clipFinished( Bar2, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ParagonStars:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

